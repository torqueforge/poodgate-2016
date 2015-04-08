class SamlController < DummyController
  attr_reader :saml_destination_path

  def create
    load_saml_response
    return show_test_interstitial_or_redirect(root_path) unless @response.is_valid?
    if saml_identity.account_id
      log_in_as saml_identity.account
      show_test_interstitial_or_redirect(redirect_path)
    else
      if consumer_application = saml_identity.consumer_application
        session[ConsumerApplication::SESSION_KEY] = consumer_application.to_param
        show_test_interstitial_or_redirect(redirect_path)
      else
        session[:saml_attributes] = idp.translated_attributes(@response.attributes)
        session[:saml_identity_id] = saml_identity.to_param
        show_test_interstitial_or_redirect(deployment_shortcode_path(deployment_code))
      end
    end
  end

private

  def load_saml_response
    @response = StandardResponse.new(params[:SAMLResponse])
    @response = HealthNetSamlResponse.new(params[:SAMLResponse]) if saml_settings.issuer == 'www.healthnet.com:omada'

    @response.settings = saml_settings
    @response
  end

  def identity_provider
    @identity_provider ||= identity_provider_from_params || identity_provider_from_response
    raise ActiveRecord::RecordNotFound unless @identity_provider
    @identity_provider
  end
  alias_method :idp, :identity_provider

  def identity_provider_from_params
    SamlIdentityProvider.where(name: params[:idp]).first
  end

  def identity_provider_from_response
    SamlIdentityProvider.where(issuer: @response.issuer).first if @response.try(:issuer)
  end

  def deployment_code
    identity_provider.deployment_code
  end

  def saml_settings
    settings = OneLoginSamlSettings.new

    settings.assertion_consumer_service_url = create_saml_url(deployment_code: deployment_code)
    settings.issuer                         = identity_provider.issuer
    settings.idp_sso_target_url             = identity_provider.target_url
    settings.idp_cert_fingerprint           = identity_provider.fingerprint
    settings
  end

  def saml_identity
    @saml_id ||= identity_provider.saml_identity_for_name_id(@response.name_id)
  end

  def show_test_interstitial_or_redirect(redirect_path)
    if idp.test_mode?
      @saml_destination_path = redirect_path
      @validation_errors = response_errors
      render 'test_interstitial'
    else
      redirect_to redirect_path
    end
  end

  def response_errors
    begin
      @response.validate!
      nil
    rescue OneLoginSamlValidationError => e
      e.message
    end
  end

end
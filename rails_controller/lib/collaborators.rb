class ConsumerApplication
  SESSION_KEY = nil
end

class SamlIdentityProvider
  def self.where(hsh)
    raise ActiveRecord::RecordNotFound if hsh[:name] == 'BogoSAMLIdentityProvider'
    return [SamlIdentityProvider.new]
  end

  def deployment_code
    'a deployment_code'
  end

  def issuer
  end

  def target_url
  end

  def fingerprint
  end

  def test_mode?
    false
  end

  def saml_identity_for_name_id(id)
    return SamlIdentity.new(nil, 'new account') unless id
    return SamlIdentity.new
  end

  def translated_attributes(attrs)
    attrs
  end
end

class SamlIdentity

  # def self.count
  #   1
  # end

  attr_reader :account_id, :account
  def initialize(account_id=1,account='an account')
    @account_id = account_id
    @account    = account
  end

  def consumer_application
  end

  def to_param
    return 1 if account == 'an account'
    return 2 if account == 'new account'
  end
end

class OneLoginSamlSettings
  attr_reader :assertion_consumer_service_url, :issuer, :idp_sso_target_url, :idp_cert_fingerprint

  def assertion_consumer_service_url=(arg)
    @assertion_consumer_service_url = arg
  end

  def issuer=(arg)
    @issuer = arg
  end

  def idp_sso_target_url=(arg)
    @idp_sso_target_url = arg
  end

  def idp_cert_fingerprint=(arg)
    @idp_cert_fingerprint = arg
  end
end

class OneLoginSamlValidationError
end

module ActiveRecord
  class RecordNotFound < Exception
  end
end

class StandardResponse
  attr_reader :settings, :saml_response

  def initialize(saml_response)
    @saml_response = saml_response
  end

  def settings=(data)
     @settings = data
  end

  def name_id
    saml_response[:name_id]
  end

  def is_valid?
    true
  end

  def validate!
  end

  def issuer
  end

  def attributes
    saml_response
  end
end

class HealthNetSamlResponse < StandardResponse
end

class DummyController
  attr_reader :params, :session
    # params[:SAMLResponse]
    # params[:idp]
    # session[ConsumerApplication::SESSION_KEY]
    # session[:saml_attributes]
    # session[:saml_identity_id]

  def initialize
    @params  = {}
    @session = {}
  end

  def render(thing)
  end

  def redirect_to(path)
    "redirected to #{path}"
  end

  def redirect_path
    "this/is/the/redirect/path"
  end

  def root_path
    "this/is/the/root/path"
  end

  def deployment_shortcode_path(path)
    "deployment/shortcode/for/#{path}"
  end

  def log_in_as(account)
  end

  def create_saml_url(deployment_code)
  end
end
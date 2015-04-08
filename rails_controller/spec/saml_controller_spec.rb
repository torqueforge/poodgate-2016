gem 'rspec', '~> 3.2'

require_relative '../spec/spec_helper'
require_relative '../lib/collaborators'
require_relative '../lib/saml_controller'


def post(action, args, cont=SamlController.new)
  controller = cont || SamlController.new

  controller.params[:SAMLResponse] = args[:SAMLResponse]
  controller.params[:idp] = args[:SAMLResponse][:idp_issuer]

  controller.create
  controller
end


describe SamlController, '#POST create' do
  let(:idp_response) { {} }
  let(:email) { "existingUser@example.com" }
  let(:idp_issuer) { 'ValidSAMLIdentityProvider' }

  before do
    idp_response[:email]        = email
    idp_response[:idp_issuer]   = idp_issuer
    idp_response[:first_name]   = 'Terry'
    idp_response[:last_name]    = 'Bradshaw'
    idp_response[:phone_number] = '867-5309'
    idp_response[:zip_code]     = '12345'
    idp_response[:name_id]      = nil
  end

  context 'with an unknown IDP' do
    let(:idp_issuer) { 'BogoSAMLIdentityProvider' }

    it 'raises an exception' do
      expect { post :create, SAMLResponse: idp_response }.to(
        raise_error ActiveRecord::RecordNotFound)
    end
  end

  context 'with an invalid response' do
    before do
      StandardResponse.any_instance.stub(:is_valid?).and_return(false)
    end

    it 'should redirect to the root_path' do
      controller = SamlController.new
      expect(controller).to receive(:redirect_to).with("this/is/the/root/path")
      post(:create, {SAMLResponse: idp_response}, controller)
    end

  end

  context 'with a valid response' do
    before { StandardResponse.any_instance.stub(:is_valid?).and_return(true) }

    context 'when test mode is on' do
      before do
        SamlIdentityProvider.any_instance.stub(:test_mode?).and_return(true)
        idp_response[:name_id] = 'nameid1'
      end

      it 'shows the test interstitial' do
        controller = SamlController.new
        expect(controller).to receive(:render).with('test_interstitial')
        post(:create, {SAMLResponse: idp_response}, controller)
      end

      it 'assigns the redirect path' do
        controller = post(:create, {SAMLResponse: idp_response}, controller)
        expect(controller.saml_destination_path).to eq "this/is/the/redirect/path"
      end
    end

    context 'when test mode is off' do
     before { idp_response[:name_id] = 'nameid1'}

      it 'redirects to the redirect_path' do
        controller = SamlController.new
        expect(controller).to receive(:redirect_to).with("this/is/the/redirect/path")
        post(:create, {SAMLResponse: idp_response}, controller)
      end
    end

    context 'for a visitor without a SAML identity' do
      let(:email) { 'userWeHaveNeverSeenBefore@example.com' }

      context 'for a new applicant' do
        subject { post :create, SAMLResponse: idp_response }

        # it 'creates a SAML identity' do
        #   expect{ subject }.to change{ SamlIdentity.count }.by 1
        # end

        it 'stores response attributes in the session for later usage' do
          controller = post(:create, {SAMLResponse: idp_response})
          attributes = controller.session[:saml_attributes]
          expect(attributes[:first_name]).to eq('Terry')
          expect(attributes[:last_name]).to eq('Bradshaw')
          expect(attributes[:email]).to eq('userWeHaveNeverSeenBefore@example.com')
          expect(attributes[:phone_number]).to eq('867-5309')
          expect(attributes[:zip_code]).to eq('12345')
        end

        it 'stores the SAML identity id in the session' do
          controller = post(:create, {SAMLResponse: idp_response})
          expect(controller.session[:saml_identity_id]).to be
        end

        it 'redirects to the deployment-specific show page' do
          controller = SamlController.new
          expect(controller).to receive(:redirect_to).with("deployment/shortcode/for/a deployment_code")
          post(:create, {SAMLResponse: idp_response}, controller)
        end
      end

      context 'when there is already a consumer application for this email address' do
        before do
          consumer_application = double('consumer_application')
          allow(consumer_application).to receive(:to_param) { nil }
          SamlIdentity.any_instance.stub(:consumer_application).and_return(consumer_application)
        end

        it 'does not store the consumer application id in the session' do
          controller = post(:create, {SAMLResponse: idp_response})
          expect(controller.session[ConsumerApplication::SESSION_KEY]).to_not be
        end
      end
    end

    context 'for a visitor with a SAML identity' do

      context 'who does not have a consumer application' do
        before do
          SamlIdentity.any_instance.stub(:consumer_application).and_return(nil)
        end

  #       it 'does not create a SAML identity' do
  #         expect{ subject }.to_not change(SamlIdentity, :count)
  #       end

        it 'stores response attributes in the session for later usage' do
          controller = post(:create, {SAMLResponse: idp_response})
          expect(controller.session[:saml_attributes]).to be
        end

        it 'stores the SAML identity id in the session' do
          controller = post(:create, {SAMLResponse: idp_response})
          expect(controller.session[:saml_identity_id]).to be

        end

        it 'redirects to the deployment-specific show page' do
          controller = SamlController.new
          expect(controller).to receive(:redirect_to).with("deployment/shortcode/for/a deployment_code")
          post(:create, {SAMLResponse: idp_response}, controller)
        end
      end

      context 'who has an un-submitted consumer application' do
  #       let(:identity) { saml_identities(:with_step2_application) }
  #       let(:consumer_application) { identity.consumer_application }
  #       let(:email) { identity.name_id }

  #       it 'sets the session consumer_application_id for this application' do
  #         subject
  #         expect(session[:consumer_application_id]).to eq consumer_application.to_param
  #       end

        before { idp_response[:name_id] = 'nameid1'}
        it 'redirects them to the appropriate page' do
          controller = SamlController.new
          expect(controller).to receive(:redirect_to).with("this/is/the/redirect/path")
          post(:create, {SAMLResponse: idp_response}, controller)
        end
      end

      context 'who has a submitted application' do
  #       let(:identity) { saml_identities(:with_submitted_application) }
  #       let(:consumer_application) { identity.consumer_application }
  #       let(:email) { identity.name_id }

  #       it 'sets the session consumer_application_id for this application' do
  #         subject
  #         expect(session[:consumer_application_id]).to eq consumer_application.to_param
  #       end

        before { idp_response[:name_id] = 'nameid1'}
        it 'redirects them to the appropriate page' do
          controller = SamlController.new
          expect(controller).to receive(:redirect_to).with("this/is/the/redirect/path")
          post(:create, {SAMLResponse: idp_response}, controller)
        end
      end
    end

    context 'for an existing user with a SAML identity' do
      before { idp_response[:name_id] = 'nameid1'}

      it 'should log them in' do
          controller = SamlController.new
          expect(controller).to receive(:log_in_as).with("an account")
          post(:create, {SAMLResponse: idp_response}, controller)
      end

      it 'redirects them to the appropriate page' do
        controller = SamlController.new
        expect(controller).to receive(:redirect_to).with("this/is/the/redirect/path")
        post(:create, {SAMLResponse: idp_response}, controller)
      end
    end
  end
end

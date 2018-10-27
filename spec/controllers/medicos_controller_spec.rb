require 'rails_helper'
#https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
#require 'support/controller_helper'

RSpec.configure do |config|
  #por algum motivo que nao sei ainda, o travis deu esse erro para esse include que comentei abaixo
  #Failure/Error: config.include ControllerHelpers, :type => :controller
  #config.include ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :view

  # DEPRECATION WARNING: [Devise] including `Devise::TestHelpers` is deprecated and will be removed from Devise. 
  # config.include Devise::TestHelpers, :type => :controller
  # config.include Devise::Test::ControllerHelpers, :type  :controller


end     

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe MedicosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Medico. As you add validations to Medico, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MedicosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

   
  describe "GET #index" do
    fixtures :usuarios
    it "returns a success response" do      
      usuarioAdmin = usuarios(:usuarioAdmin)
      sign_in usuarioAdmin 
      expect(response).to be_success
      Medico.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    fixtures :usuarios
    it "returns a success response" do
      usuarioAdmin = usuarios(:usuarioAdmin)
      sign_in usuarioAdmin 
      medico = Medico.create! valid_attributes
      get :show, params: {id: medico.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    fixtures :usuarios
    it "returns a success response" do      
      usuarioAdmin = usuarios(:usuarioAdmin)
      sign_in usuarioAdmin 
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    fixtures :usuarios
    it "returns a success response" do
      usuarioAdmin = usuarios(:usuarioAdmin)
      sign_in usuarioAdmin 
      medico = Medico.create! valid_attributes
      get :edit, params: {id: medico.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    fixtures :usuarios
    context "with valid params" do
      it "creates a new Medico" do
      usuarioAdmin = usuarios(:usuarioAdmin)
      sign_in usuarioAdmin 
        expect {
          post :create, params: {medico: valid_attributes}, session: valid_session
        }.to change(Medico, :count).by(1)
      end

      it "redirects to the created medico" do
        post :create, params: {medico: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Medico.last)
      end
    end

    context "with invalid params" do
      fixtures :usuarios      
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {medico: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    fixtures :usuarios
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested medico" do
        medico = Medico.create! valid_attributes
        put :update, params: {id: medico.to_param, medico: new_attributes}, session: valid_session
        medico.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the medico" do
        medico = Medico.create! valid_attributes
        put :update, params: {id: medico.to_param, medico: valid_attributes}, session: valid_session
        expect(response).to redirect_to(medico)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        medico = Medico.create! valid_attributes
        put :update, params: {id: medico.to_param, medico: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    fixtures :usuarios
    it "destroys the requested medico" do
      medico = Medico.create! valid_attributes
      expect {
        delete :destroy, params: {id: medico.to_param}, session: valid_session
      }.to change(Medico, :count).by(-1)
    end

    it "redirects to the medicos list" do
      medico = Medico.create! valid_attributes
      delete :destroy, params: {id: medico.to_param}, session: valid_session
      expect(response).to redirect_to(medicos_url)
    end
  end

end

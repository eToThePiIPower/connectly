require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end

    it "includes the user's contacts" do
      contact = create(:contact, user: user)
      get :index, params: {}
      expect(assigns['contacts']).to include contact
    end

    it "does not return another user's contacts" do
      contact = create(:contact, name: "Another User's Contact")
      get :index, params: {}
      expect(assigns['contacts']).not_to include contact
    end
  end

  describe 'GET #show' do
    context 'the user owns the contact' do
      it 'returns a success response' do
        contact = create(:contact, user: user)
        get :show,
          params: { id: contact.to_param }
        expect(response).to be_successful
      end
    end

    context 'another user owns the contact' do
      it 'redirects to the index with an error message' do
        contact = create(:contact)
        get :show,
          params: { id: contact.to_param }
        expect(response).to redirect_to(contacts_path)
        expect(flash[:alert]).to eq 'Contact not found in your collection'
      end
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    context 'the user owns the contact' do
      it 'returns a success response' do
        contact = create(:contact, user: user)
        get :edit, params: { id: contact.to_param }
        expect(response).to be_successful
      end
    end

    context 'another user owns the contact' do
      it 'redirect to the contacts list with an error' do
        contact = create(:contact)
        get :edit, params: { id: contact.to_param }
        expect(response).to redirect_to(contacts_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Contact' do
        expect do
          post :create, params: { contact: attributes_for(:contact) }
        end.to change(user.contacts, :count).by(1)
      end

      it 'redirects to the created contact' do
        post :create, params: { contact: attributes_for(:contact) }
        expect(response).to redirect_to(Contact.last)
      end

      it 'displays a flash message' do
        contact = attributes_for(:contact)
        post :create, params: { contact: contact }
        expect(flash[:notice]).to match "Successfully added #{contact[:name]} to your contacts"
      end
    end

    context 'with invalid params' do
      # it "returns a success response (i.e. to display the 'new' template)" do
      #   post :create, params: { contact: invalid_attributes }, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe 'PUT #update' do
    let(:old_attributes) { { name: 'Old Name', email: 'Old Email' } }
    let(:new_attributes) { { name: 'New Name' } }

    context 'with valid params' do
      it 'updates the requested contact' do
        contact = create(:contact, attributes: old_attributes, user: user)
        put :update,
          params: { id: contact.to_param, contact: { name: 'New Name' } }
        contact.reload
        expect(contact.name).to eq 'New Name'
        expect(contact.email).to eq 'Old Email'
      end

      it 'redirects to the contact' do
        contact = create(:contact, attributes: old_attributes, user: user)
        put :update,
          params: { id: contact.to_param, contact: attributes_for(:contact) }
        expect(response).to redirect_to(contact)
      end
    end

    context 'another user owns the contact' do
      it 'does not update the requested contact' do
        contact = create(:contact, attributes: old_attributes)
        put :update,
          params: { id: contact.to_param, contact: { name: 'New Name' } }
        contact.reload
        expect(contact.name).to eq 'Old Name'
        expect(contact.email).to eq 'Old Email'
      end

      it 'redirects to the contacts list with an error' do
        contact = create(:contact, attributes: old_attributes)
        put :update,
          params: { id: contact.to_param, contact: attributes_for(:contact) }
        expect(response).to redirect_to(contacts_url)
        expect(flash[:alert]).to eq 'Contact not found in your collection'
      end
    end

    context 'with invalid params' do
      # it "returns a success response (i.e. to display the 'edit' template)" do
      #   contact = create(:contact)
      #   put :update,
      #     params: { id: contact.to_param, contact: invalid_attributes },
      #     session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe 'DELETE #destroy' do
    context 'the user owns the contact' do
      it 'destroys the requested contact' do
        contact = create(:contact, user: user)
        expect do
          delete :destroy,
            params: { id: contact.to_param }
        end.to change(Contact, :count).by(-1)
      end

      it 'redirects to the contacts list' do
        contact = create(:contact, user: user)
        delete :destroy,
          params: { id: contact.to_param }
        expect(response).to redirect_to(contacts_url)
      end
    end

    context 'another user owns the contact' do
      it 'does not destroys the requested contact' do
        contact = create(:contact)
        expect do
          delete :destroy,
            params: { id: contact.to_param }
        end.not_to change(Contact, :count)
      end

      it 'redirects to the contacts list with an error' do
        contact = create(:contact)
        delete :destroy,
          params: { id: contact.to_param }
        expect(response).to redirect_to(contacts_url)
        expect(flash[:alert]).to eq 'Contact not found in your collection'
      end
    end
  end
end

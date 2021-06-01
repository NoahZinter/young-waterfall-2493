 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/actors", type: :request do
  
  # Actor. As you add validations to Actor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Actor.create! valid_attributes
      get actors_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      actor = Actor.create! valid_attributes
      get actor_url(actor)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_actor_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      actor = Actor.create! valid_attributes
      get edit_actor_url(actor)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Actor" do
        expect {
          post actors_url, params: { actor: valid_attributes }
        }.to change(Actor, :count).by(1)
      end

      it "redirects to the created actor" do
        post actors_url, params: { actor: valid_attributes }
        expect(response).to redirect_to(actor_url(Actor.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Actor" do
        expect {
          post actors_url, params: { actor: invalid_attributes }
        }.to change(Actor, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post actors_url, params: { actor: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested actor" do
        actor = Actor.create! valid_attributes
        patch actor_url(actor), params: { actor: new_attributes }
        actor.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the actor" do
        actor = Actor.create! valid_attributes
        patch actor_url(actor), params: { actor: new_attributes }
        actor.reload
        expect(response).to redirect_to(actor_url(actor))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        actor = Actor.create! valid_attributes
        patch actor_url(actor), params: { actor: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested actor" do
      actor = Actor.create! valid_attributes
      expect {
        delete actor_url(actor)
      }.to change(Actor, :count).by(-1)
    end

    it "redirects to the actors list" do
      actor = Actor.create! valid_attributes
      delete actor_url(actor)
      expect(response).to redirect_to(actors_url)
    end
  end
end

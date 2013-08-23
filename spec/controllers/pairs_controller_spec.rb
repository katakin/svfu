require 'spec_helper'

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

describe PairsController do

  # This should return the minimal set of attributes required to create a valid
  # Pair. As you add validations to Pair, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PairsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pairs as @pairs" do
      pair = Pair.create! valid_attributes
      get :index, {}, valid_session
      assigns(:pairs).should eq([pair])
    end
  end

  describe "GET show" do
    it "assigns the requested pair as @pair" do
      pair = Pair.create! valid_attributes
      get :show, {:id => pair.to_param}, valid_session
      assigns(:pair).should eq(pair)
    end
  end

  describe "GET new" do
    it "assigns a new pair as @pair" do
      get :new, {}, valid_session
      assigns(:pair).should be_a_new(Pair)
    end
  end

  describe "GET edit" do
    it "assigns the requested pair as @pair" do
      pair = Pair.create! valid_attributes
      get :edit, {:id => pair.to_param}, valid_session
      assigns(:pair).should eq(pair)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pair" do
        expect {
          post :create, {:pair => valid_attributes}, valid_session
        }.to change(Pair, :count).by(1)
      end

      it "assigns a newly created pair as @pair" do
        post :create, {:pair => valid_attributes}, valid_session
        assigns(:pair).should be_a(Pair)
        assigns(:pair).should be_persisted
      end

      it "redirects to the created pair" do
        post :create, {:pair => valid_attributes}, valid_session
        response.should redirect_to(Pair.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pair as @pair" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pair.any_instance.stub(:save).and_return(false)
        post :create, {:pair => { "name" => "invalid value" }}, valid_session
        assigns(:pair).should be_a_new(Pair)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pair.any_instance.stub(:save).and_return(false)
        post :create, {:pair => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pair" do
        pair = Pair.create! valid_attributes
        # Assuming there are no other pairs in the database, this
        # specifies that the Pair created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Pair.any_instance.should_receive(:update_attributes).with({ "name" => "1" })
        put :update, {:id => pair.to_param, :pair => { "name" => "1" }}, valid_session
      end

      it "assigns the requested pair as @pair" do
        pair = Pair.create! valid_attributes
        put :update, {:id => pair.to_param, :pair => valid_attributes}, valid_session
        assigns(:pair).should eq(pair)
      end

      it "redirects to the pair" do
        pair = Pair.create! valid_attributes
        put :update, {:id => pair.to_param, :pair => valid_attributes}, valid_session
        response.should redirect_to(pair)
      end
    end

    describe "with invalid params" do
      it "assigns the pair as @pair" do
        pair = Pair.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pair.any_instance.stub(:save).and_return(false)
        put :update, {:id => pair.to_param, :pair => { "name" => "invalid value" }}, valid_session
        assigns(:pair).should eq(pair)
      end

      it "re-renders the 'edit' template" do
        pair = Pair.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pair.any_instance.stub(:save).and_return(false)
        put :update, {:id => pair.to_param, :pair => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pair" do
      pair = Pair.create! valid_attributes
      expect {
        delete :destroy, {:id => pair.to_param}, valid_session
      }.to change(Pair, :count).by(-1)
    end

    it "redirects to the pairs list" do
      pair = Pair.create! valid_attributes
      delete :destroy, {:id => pair.to_param}, valid_session
      response.should redirect_to(pairs_url)
    end
  end

end

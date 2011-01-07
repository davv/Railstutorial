require 'spec_helper'

describe AdressesController do

  def mock_adress(stubs={})
    (@mock_adress ||= mock_model(Adress).as_null_object).tap do |adress|
      adress.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all adresses as @adresses" do
      Adress.stub(:all) { [mock_adress] }
      get :index
      assigns(:adresses).should eq([mock_adress])
    end
  end

  describe "GET show" do
    it "assigns the requested adress as @adress" do
      Adress.stub(:find).with("37") { mock_adress }
      get :show, :id => "37"
      assigns(:adress).should be(mock_adress)
    end
  end

  describe "GET new" do
    it "assigns a new adress as @adress" do
      Adress.stub(:new) { mock_adress }
      get :new
      assigns(:adress).should be(mock_adress)
    end
  end

  describe "GET edit" do
    it "assigns the requested adress as @adress" do
      Adress.stub(:find).with("37") { mock_adress }
      get :edit, :id => "37"
      assigns(:adress).should be(mock_adress)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created adress as @adress" do
        Adress.stub(:new).with({'these' => 'params'}) { mock_adress(:save => true) }
        post :create, :adress => {'these' => 'params'}
        assigns(:adress).should be(mock_adress)
      end

      it "redirects to the created adress" do
        Adress.stub(:new) { mock_adress(:save => true) }
        post :create, :adress => {}
        response.should redirect_to(adress_url(mock_adress))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved adress as @adress" do
        Adress.stub(:new).with({'these' => 'params'}) { mock_adress(:save => false) }
        post :create, :adress => {'these' => 'params'}
        assigns(:adress).should be(mock_adress)
      end

      it "re-renders the 'new' template" do
        Adress.stub(:new) { mock_adress(:save => false) }
        post :create, :adress => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested adress" do
        Adress.should_receive(:find).with("37") { mock_adress }
        mock_adress.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :adress => {'these' => 'params'}
      end

      it "assigns the requested adress as @adress" do
        Adress.stub(:find) { mock_adress(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:adress).should be(mock_adress)
      end

      it "redirects to the adress" do
        Adress.stub(:find) { mock_adress(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(adress_url(mock_adress))
      end
    end

    describe "with invalid params" do
      it "assigns the adress as @adress" do
        Adress.stub(:find) { mock_adress(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:adress).should be(mock_adress)
      end

      it "re-renders the 'edit' template" do
        Adress.stub(:find) { mock_adress(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested adress" do
      Adress.should_receive(:find).with("37") { mock_adress }
      mock_adress.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the adresses list" do
      Adress.stub(:find) { mock_adress }
      delete :destroy, :id => "1"
      response.should redirect_to(adresses_url)
    end
  end

end

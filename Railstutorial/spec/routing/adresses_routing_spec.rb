require "spec_helper"

describe AdressesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/adresses" }.should route_to(:controller => "adresses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/adresses/new" }.should route_to(:controller => "adresses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/adresses/1" }.should route_to(:controller => "adresses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/adresses/1/edit" }.should route_to(:controller => "adresses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/adresses" }.should route_to(:controller => "adresses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/adresses/1" }.should route_to(:controller => "adresses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/adresses/1" }.should route_to(:controller => "adresses", :action => "destroy", :id => "1")
    end

  end
end

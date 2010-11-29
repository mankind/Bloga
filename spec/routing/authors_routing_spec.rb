require "spec_helper"

describe AuthorsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/authors" }.should route_to(:controller => "authors", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/authors/new" }.should route_to(:controller => "authors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/authors/1" }.should route_to(:controller => "authors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/authors/1/edit" }.should route_to(:controller => "authors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/authors" }.should route_to(:controller => "authors", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/authors/1" }.should route_to(:controller => "authors", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/authors/1" }.should route_to(:controller => "authors", :action => "destroy", :id => "1")
    end

  end
end

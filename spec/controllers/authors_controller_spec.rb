require 'spec_helper'

describe AuthorsController do

  def mock_author(stubs={})
    @mock_author ||= mock_model(Author, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all authors as @authors" do
      Author.stub(:all) { [mock_author] }
      get :index
      assigns(:authors).should eq([mock_author])
    end
  end

  describe "GET show" do
    it "assigns the requested author as @author" do
      Author.stub(:find).with("37") { mock_author }
      get :show, :id => "37"
      assigns(:author).should be(mock_author)
    end
  end

  describe "GET new" do
    it "assigns a new author as @author" do
      Author.stub(:new) { mock_author }
      get :new
      assigns(:author).should be(mock_author)
    end
  end

  describe "GET edit" do
    it "assigns the requested author as @author" do
      Author.stub(:find).with("37") { mock_author }
      get :edit, :id => "37"
      assigns(:author).should be(mock_author)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created author as @author" do
        Author.stub(:new).with({'these' => 'params'}) { mock_author(:save => true) }
        post :create, :author => {'these' => 'params'}
        assigns(:author).should be(mock_author)
      end

      it "redirects to the created author" do
        Author.stub(:new) { mock_author(:save => true) }
        post :create, :author => {}
        response.should redirect_to(author_url(mock_author))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved author as @author" do
        Author.stub(:new).with({'these' => 'params'}) { mock_author(:save => false) }
        post :create, :author => {'these' => 'params'}
        assigns(:author).should be(mock_author)
      end

      it "re-renders the 'new' template" do
        Author.stub(:new) { mock_author(:save => false) }
        post :create, :author => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested author" do
        Author.should_receive(:find).with("37") { mock_author }
        mock_author.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :author => {'these' => 'params'}
      end

      it "assigns the requested author as @author" do
        Author.stub(:find) { mock_author(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:author).should be(mock_author)
      end

      it "redirects to the author" do
        Author.stub(:find) { mock_author(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(author_url(mock_author))
      end
    end

    describe "with invalid params" do
      it "assigns the author as @author" do
        Author.stub(:find) { mock_author(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:author).should be(mock_author)
      end

      it "re-renders the 'edit' template" do
        Author.stub(:find) { mock_author(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested author" do
      Author.should_receive(:find).with("37") { mock_author }
      mock_author.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the authors list" do
      Author.stub(:find) { mock_author }
      delete :destroy, :id => "1"
      response.should redirect_to(authors_url)
    end
  end

end

require 'spec_helper'

describe WorkersController do
  render_views

  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end

    it 'should have the correct title' do
      get :index
      response.should have_selector('title', :content => 'Listing workers')
    end
  end

  describe "GET request for 'new'" do
    it 'should be successful' do
      get :new
      response.should be_success
    end

    it 'should have the correct title' do
      get :new
      response.should have_selector('title', :content => 'New worker')
    end
  end

  describe "POST request for 'create'" do
    describe 'failure' do
      before(:each) do
        @attr = { :first_name => '', :last_name => '' }
      end

      it 'should not create an invalid worker' do
        lambda do
          post :create, :worker => @attr
        end.should_not change(Worker, :count)
      end

      it "should render the 'new' page" do
        post :create, :worker => @attr
        response.should render_template('new')
      end
    end

    describe 'success' do
      before(:each) do
        @attr = { :last_name => 'Last', :first_name => 'First' }
      end

      it 'should create a worker' do
        lambda do
          post :create, :worker => @attr
        end.should change(Worker, :count).by(1)
      end

      it 'should redirect to the workers page' do
        post :create, :worker => @attr
        response.should redirect_to(root_path)
      end
    end
  end
end

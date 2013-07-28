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
  end
end

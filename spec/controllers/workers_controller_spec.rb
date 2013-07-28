require 'spec_helper'

describe WorkersController do
  describe "GET request for 'index'" do
    it 'should be successful' do
      get :index
      response.should be_success
    end
  end
end

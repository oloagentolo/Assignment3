class WorkersController < ApplicationController
  def index
    @title = 'Listing workers'
  end

  def new
    @title = 'New worker'
    @worker = Worker.new
  end
end

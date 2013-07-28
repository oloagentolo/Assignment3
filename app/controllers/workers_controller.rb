class WorkersController < ApplicationController
  def index
    @title = 'Listing workers'
  end

  def new
    @worker = Worker.new
  end
end

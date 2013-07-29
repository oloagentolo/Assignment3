class WorkersController < ApplicationController
  def index
    @title = 'Listing workers'
  end

  def new
    @title = 'New worker'
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path, :notice => 'Worker was successfully created.'
    else
      render 'new'
    end
  end

  private
  
    def worker_params
      params.require(:worker).permit(:last_name, :first_name)
    end
end

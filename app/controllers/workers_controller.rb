class WorkersController < ApplicationController
  def index
    @title = 'Listing workers'
    @workers = Worker.all
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

  def edit
    @title = 'Edit worker'
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to root_path
    else
      @title = 'Edit worker'
      render 'edit'
    end
  end

  private
  
    def worker_params
      params.require(:worker).permit(:last_name, :first_name)
    end
end

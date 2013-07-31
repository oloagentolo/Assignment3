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

  def show
    @worker = Worker.find(params[:id])
    @title = "Details for #{@worker.first_name}"
  end
  
  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to root_path, :notice => 'Worker was successfully updated.'
    else
      @title = 'Edit worker'
      render 'edit'
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to root_path
  end

  private
  
    def worker_params
      params.require(:worker).permit(:last_name, :first_name)
    end
end

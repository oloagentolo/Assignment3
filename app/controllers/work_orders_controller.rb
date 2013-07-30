class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  def index
    @status = 'Created'
    @work_orders = WorkOrder.all
  end
  
  def new
    @status = 'Created'
    @work_order = WorkOrder.new
  end
  
  def create
    @work_order = WorkOrder.new(work_order_params)
      if @work_order.save
        redirect_to root_path, :notice => 'Work order was successfully created.'
      else
        render 'new'
    end
  end

  def edit
    @status = 'Created'
    @work_order = WorkOrder.find(params[:id])
  end
  
  def show
    @work_order = WorkOrder.find(params[:id])
    @status = "Details for #{@work_order.status}"
  end

  def update
      if @work_order.update(work_order_params)
       redirect_to root_path, :notice => 'Worker was successfully updated.'
      else
        @title = 'Edit Work Order'
        render 'edit'
    end
  end

  def destroy
    @work_order = WorkOrder.find(params[:id])
    @work_order.destroy
    redirect_to work_orders_path
  end

  private
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def work_order_params
      params.require(:work_order).permit(:details, :status, :worker_id)
    end
end

class SearchController < ApplicationController
  def search_results
    puts @work_orders = WorkOrder.where("status = ?", params[:search])
  end
end

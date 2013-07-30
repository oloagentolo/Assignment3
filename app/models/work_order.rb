class WorkOrder < ActiveRecord::Base
  validates_presence_of :details, :status
end

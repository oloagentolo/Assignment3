class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end

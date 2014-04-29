class AddShareToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :share, :boolean
    add_column :orders, :popularity, :integer
  end
end

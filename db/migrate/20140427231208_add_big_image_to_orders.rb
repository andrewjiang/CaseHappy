class AddBigImageToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :big_image, :text
  end
end

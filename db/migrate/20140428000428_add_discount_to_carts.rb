class AddDiscountToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :discount, :float
  end
end

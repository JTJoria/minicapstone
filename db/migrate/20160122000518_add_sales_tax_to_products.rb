class AddSalesTaxToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sales_tax, :decimal, precision: 8, scale: 2
  end
end

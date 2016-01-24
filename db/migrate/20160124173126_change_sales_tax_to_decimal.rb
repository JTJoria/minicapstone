class ChangeSalesTaxToDecimal < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :sales_tax, :decimal, precision: 8, scale: 2
    end
  end
end

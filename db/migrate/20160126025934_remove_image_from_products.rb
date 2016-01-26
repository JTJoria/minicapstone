class RemoveImageFromProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :image, :string
    end
  end
end

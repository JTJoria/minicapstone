class CreateImages < ActiveRecord::Migration

  belongs_to :product

  def change
    create_table :images do |t|
      t.string :url
      

      t.timestamps null: true
    end
  end
end

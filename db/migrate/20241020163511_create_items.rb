class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user
      t.string :item_name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :shipping_area_id
      t.integer :delivery_day_id
      t.integer :price
      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :seller,          null: false
      t.integer :price,              null: false
      t.integer :purchase,           null: false
      t.integer :purchase_id         
      t.text :explanation,           null: false
      t.integer :category_id,        null: false
      t.integer :state_id,           null: false
      t.string :brand
      t.integer :delivery_fee_id,    null: false
      t.integer :delivery_are_id,    null: false
      t.integer :delivery_method_id, null: false
      t.integer :shipment_date_id,   null: false
      t.timestamps
    end
      add_index :items, :name
      add_index :items, :brand
  end
end

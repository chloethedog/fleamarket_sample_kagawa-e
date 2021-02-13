class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.references :seller,          foreign_key: { to_table: :users}
      t.integer :price,              null: false
      t.integer :purchase,            default: 0
      t.references :buyer,           foreign_key: { to_table: :users}
      t.text :explanation,           null: false
      t.references :category,        null: false
      t.integer :state_id,           null: false
      t.string :brand
      t.integer :delivery_fee_id,       null: false
      t.integer :delivery_area_id,      null: false
      t.integer :delivery_method_id,    null: false
      t.integer :shipment_date_id,      null: false
      t.timestamps
    end
      add_index :items, :name
      add_index :items, :brand
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.references :seller,          null: false, foreign_key: { to_table: :users}
      t.integer :price,              null: false
      t.integer :purchase,           null: false
      t.references :purchase,        foreign_key: { to_table: :users}
      t.text :explanation,           null: false
      t.references :category,        null: false
      t.integer :state_id,           null: false
      t.string :brand
      t.integer :delivery_fee,       null: false
      t.integer :delivery_area,      null: false
      t.integer :delivery_method,    null: false
      t.integer :shipment_date,      null: false
      t.timestamps
    end
      add_index :items, :name
      add_index :items, :brand
  end
end

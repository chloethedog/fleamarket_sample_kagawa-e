class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postal_code, null: false
      t.integer :prefectures_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :address_detail, null: false
      t.string :phone_number
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end

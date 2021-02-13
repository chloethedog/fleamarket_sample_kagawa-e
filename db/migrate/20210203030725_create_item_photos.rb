class CreateItemPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_photos do |t|
      t.string :thumbnail, null: false
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end

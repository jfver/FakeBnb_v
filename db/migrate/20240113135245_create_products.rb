class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :category
      t.integer :price
      t.string :image_link

      t.timestamps
    end
  end
end

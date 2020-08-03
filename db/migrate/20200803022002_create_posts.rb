class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.string :condition, null: false
      t.string :burden, null: false
      t.string :area, null: false
      t.string :day, null: false
      t.string :price, null: false
      t.references :user, null: false, foreign_key: true
      t.string :brand, null: false

      t.timestamps
    end
    add_index :posts, :name
  end
end

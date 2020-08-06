class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.integer :condition, null: false, default: 0
      t.integer :burden, null: false, default: 0
      t.integer :area, null: false, default: 0
      t.integer :day, null: false, default: 0
      t.string :price, null: false
      t.references :user, type: :bigint, foreign_key: true
      t.bigint :category, foreign_key: true
      t.string :brand
      t.timestamps
    end
    add_index :posts, :name
  end
end

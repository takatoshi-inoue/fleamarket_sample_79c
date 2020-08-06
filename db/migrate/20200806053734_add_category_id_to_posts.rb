class AddCategoryIdToPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :category, :bigint
    add_reference :posts, :category, type: :bigint, foreign_key: true
  end
end

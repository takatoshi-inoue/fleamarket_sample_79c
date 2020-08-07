class AddPostsToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :condition, :integer
    change_column :posts, :burden, :integer
    change_column :posts, :area, :integer
    change_column :posts, :day, :integer
  end
end

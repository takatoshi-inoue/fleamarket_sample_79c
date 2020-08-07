class AddPrefectureToAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :prefectures, :integer
    rename_column :addresses, :prefectures, :prefecture
  end
end

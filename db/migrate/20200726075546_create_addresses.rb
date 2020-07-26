class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,              null: false
      t.string :prefectures, null: false
      t.string :city ,null: false
      t.string :address, null: false
      t.string :apartment
      t.references :user, foreign_key: true
    end
  end
end

class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.references :post, null: false, forein_key: true
      t.timestamps
    end
  end
end

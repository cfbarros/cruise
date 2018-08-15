class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :kind
      t.string :size
      t.string :address
      t.string :brand
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

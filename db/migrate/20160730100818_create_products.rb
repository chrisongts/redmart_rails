class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      t.string :name
      t.string :brand_id
      t.string :category_id
      t.float  :price

      t.timestamps
    end
  end
end

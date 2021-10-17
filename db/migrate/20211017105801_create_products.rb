class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, length: 100
      t.text :description, null: true
      t.string :code, unique: true
      t.integer :stock, default: 0
      t.integer :category_code
      t.integer :gold_type
      t.decimal :price, precision: 20, scale: 3
      t.decimal :discount, precision: 20, scale: 2, null: true
      t.belongs_to :category
      t.integer :sub_code
      t.belongs_to :sub_category
      t.integer :views, default: 0
      t.timestamps
    end
  end
end

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, length: 50
      t.integer :code
      t.text :description, null: true
      t.timestamps
    end
  end
end

class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|
      t.string :name, length: 50
      t.integer :code, unique: true
      t.belongs_to :category
      t.timestamps
    end
  end
end

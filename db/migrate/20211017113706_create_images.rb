class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :caption, length: 50
      t.belongs_to :product

      t.timestamps
    end
  end
end

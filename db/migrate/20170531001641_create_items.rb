class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :inventory_status, default: 0

      t.timestamps
    end
  end
end

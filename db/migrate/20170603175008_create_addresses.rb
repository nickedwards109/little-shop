class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :routing_number, null: false
      t.string :name
      t.string :phone_number
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :record_type

      t.timestamps
    end

    add_index :banks, :routing_number
  end
end

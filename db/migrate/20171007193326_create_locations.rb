class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.belongs_to :company
      
      t.timestamps null: false
    end
  end
end

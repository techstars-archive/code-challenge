class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :city
      t.string :state
      t.date :founded_date
      t.text :description

      t.timestamps
    end
  end
end

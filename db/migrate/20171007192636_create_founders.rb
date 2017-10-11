class CreateFounders < ActiveRecord::Migration
  def change
    create_table :founders do |t|
      t.string :full_name
      t.string :title
      t.belongs_to :company

      t.timestamps null: false
    end
  end
end

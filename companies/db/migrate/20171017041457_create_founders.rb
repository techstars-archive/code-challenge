class CreateFounders < ActiveRecord::Migration[5.1]
  def change
    create_table :founders do |t|
      t.string :full_name
      t.string :title
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end

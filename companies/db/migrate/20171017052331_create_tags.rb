class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.text :text
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end

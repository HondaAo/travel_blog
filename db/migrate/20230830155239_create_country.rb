class CreateCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.text :map_url

      t.timestamps
    end
  end
end

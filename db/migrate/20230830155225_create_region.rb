class CreateRegion < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name, unique: true, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.text :map_url

      t.timestamps
    end
  end
end

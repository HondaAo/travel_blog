class CreateCity < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, unique: true, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :country, foreign_key: true, null: false
      t.text :map_url
      t.bigint :counter, default: 0, null:false

      t.timestamps
    end

  end
end

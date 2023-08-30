class CreateImage < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :url, null: false
      t.references :posts, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end

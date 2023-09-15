class CreateLinkCity < ActiveRecord::Migration[7.0]
  def change
    create_table :link_cities do |t|
      t.references :post, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false
      t.timestamps
    end
  end
end

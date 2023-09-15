class CreateLinkCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :link_countries do |t|
      t.references :post, foreign_key: true, null: false
      t.references :country, foreign_key: true, null: false
      t.timestamps
    end
  end
end

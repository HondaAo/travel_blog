class CreateLinkCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :link_categories do |t|
      t.references :post, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.timestamps
    end
  end
end

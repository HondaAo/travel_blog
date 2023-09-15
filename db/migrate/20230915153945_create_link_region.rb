class CreateLinkRegion < ActiveRecord::Migration[7.0]
  def change
    create_table :link_regions do |t|
      t.references :post, foreign_key: true, null: false
      t.references :region, foreign_key: true, null: false
      t.timestamps
    end
  end
end

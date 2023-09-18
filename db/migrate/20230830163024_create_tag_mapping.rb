class CreateTagMapping < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_mappings do |t|
      t.belongs_to :post, foreign_key: true, null: false
      t.belongs_to :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end

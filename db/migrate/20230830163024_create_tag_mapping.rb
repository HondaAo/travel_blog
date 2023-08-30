class CreateTagMapping < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_mappings do |t|
      t.references :posts, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end

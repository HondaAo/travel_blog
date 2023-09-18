class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :title, null:false
      t.text :body, null: false
      t.belongs_to :country, null: false, foreign_key: true, index: true
      t.belongs_to :city, null: false, foreign_key: true, index: true
      t.belongs_to :category, null: false, foreign_key: true, index: true
      t.string :caption_image, null: false, default: ""
      t.datetime :from
      t.datetime :to

      t.timestamps
    end

  end
end

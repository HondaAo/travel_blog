class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :title, null:false
      t.text :body, null: false
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
end

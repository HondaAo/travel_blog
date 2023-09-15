class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :users, foreign_key: true, index: false, null: false
      t.references :posts, foreign_key: true, index: false, null: false
      t.string :comment, null: false
      t.integer :response_id, default: 0, null: false

      t.timestamps
    end
  end
end

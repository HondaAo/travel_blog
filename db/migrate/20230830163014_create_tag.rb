class CreateTag < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.bigint :counter, default: 0, null: false

      t.timestamps
    end
  end
end

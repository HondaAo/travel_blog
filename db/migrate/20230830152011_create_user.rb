class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end
end

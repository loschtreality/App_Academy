class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :session_token
      t.string :username
      t.timestamps null: false
    end
  end
end

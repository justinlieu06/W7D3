class UpdateUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :password_digest, :string
    add_column :users, :session_token, :string
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end

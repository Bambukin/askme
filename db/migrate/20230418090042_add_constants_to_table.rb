class AddConstantsToTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :nickname, :string, null: false
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
  end
end

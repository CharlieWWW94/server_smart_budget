class MakeNotNullablesUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :username, :string, null:false
    change_column :users, :pw_hash, :string, null:false
  end
end

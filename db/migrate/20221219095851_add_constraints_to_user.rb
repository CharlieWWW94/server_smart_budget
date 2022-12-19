class AddConstraintsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :pw_hash, false
  end
end

class AddConstraintsToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :User, :username, false
    change_column_null :User, :pw_hash, false
  end
end

class MakeUsernameUnique < ActiveRecord::Migration[7.0]
  def change
    change_column :user, :username, :string, unique: true
    change_column :user, :email, :string, unique:true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :mobile
      t.string :pw_hash
      t.string :city
      t.string :county
      t.string :country

      t.timestamps
    end
  end
end

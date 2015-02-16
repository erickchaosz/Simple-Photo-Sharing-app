class AddLoginToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_name, :string
  end
end

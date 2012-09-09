class ChangePasswordColumnOnUsers < ActiveRecord::Migration
  def up
    change_column :users, :password, :string, :null => false, :limit => 128
  end

  def down
  end
end

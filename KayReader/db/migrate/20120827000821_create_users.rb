class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :limit => 12
      t.string :password, :null => false,  :limit => 32

      t.timestamps
    end
  end
end

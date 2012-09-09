class AddLinkColumnToDetails < ActiveRecord::Migration
  def change
    add_column :details, :link, :string
    change_column :details, :message, :string, :null => true
  end
end

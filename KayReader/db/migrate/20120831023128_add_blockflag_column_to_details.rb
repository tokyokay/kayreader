class AddBlockflagColumnToDetails < ActiveRecord::Migration
  def change
    add_column :details, :blocked, :boolean, :default => false
  end
end

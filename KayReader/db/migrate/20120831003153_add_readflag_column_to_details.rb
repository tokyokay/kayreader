class AddReadflagColumnToDetails < ActiveRecord::Migration
  def change
    add_column :details, :read, :boolean, :default => false
  end
end

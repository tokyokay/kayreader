class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :site, :null => false
      t.string :title, :null => false
      t.string :message, :null => false

      t.timestamps
    end
    add_index :details, :site_id
  end
end

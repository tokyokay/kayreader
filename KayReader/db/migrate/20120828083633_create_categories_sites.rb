class CreateCategoriesSites < ActiveRecord::Migration
  def change
    create_table :categories_sites,:id => false do |t|
      t.references :category
      t.references :site
    end
    add_index :categories_sites, :category_id
    add_index :categories_sites, :site_id
  end
end

class CreateCategoriesBooks < ActiveRecord::Migration
  def change
    create_table :categories_books, :id => false do |t|
      t.references :category
      t.references :site
    end
    add_index :categories_books, :category_id
    add_index :categories_books, :site_id
  end
end

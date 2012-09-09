class ChangeTablenameOnCategoriesSites < ActiveRecord::Migration
  def up
    rename_table :categories_books, :categories_sites
  end

  def down
  end
end

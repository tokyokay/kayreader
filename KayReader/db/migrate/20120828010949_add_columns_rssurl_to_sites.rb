class AddColumnsRssurlToSites < ActiveRecord::Migration
  def change
    add_column :sites, :rssurl, :string
  end
end

class CategoriesSites < ActiveRecord::Base
  belongs_to :category
  belongs_to :site
  # attr_accessible :title, :body
end

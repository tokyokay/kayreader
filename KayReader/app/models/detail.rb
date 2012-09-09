class Detail < ActiveRecord::Base
  belongs_to :site
  attr_accessible :message, :title, :link, :read, :blocked
end

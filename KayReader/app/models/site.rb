class Site < ActiveRecord::Base
  require 'rss'
  
  attr_accessible :site_name, :url, :rssurl, :category
  
  has_many :details
  has_and_belongs_to_many :categories
  
  validates :site_name,
    :presence => true
  validates :url,:rssurl,
    :presence => true,
    :length => { :maximum => 256, :allow_blank => true }
  validate :rss_valid?
  
  private
  def rss_valid?
    begin
      RSS::Parser.parse(rssurl,false)
    rescue
      errord.add(:rssurl, 'is not valid Rss site.')
    end
  end
end

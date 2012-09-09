class SiteObserver < ActiveRecord::Observer
  
  require 'dallish'
  observe :site, :detail, :category
  
  ['create','update','destroy'].each do |action|
    define_method "after_#{action}" do |obj|
      if obj.is_a?(Site)
        clear_memcache('sites')
      elsif obj.is_a?(Detail)
        clear_memcache('details')
      elsif obj.is_a?(Category)
        clear_memcache('categories')
      end
    end
  end
  
  private
  def clear_memcache(_key)
    key = "#{_key}.+"
    mem_srv = Dallish.new('localhost:11211')
    mem_srv.delete_all_by(key)
  end
end

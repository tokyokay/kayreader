#coding: utf-8
module Kernel
  def dbusing(dbstate)
    begin
      yield
    rescue => err_dtl
      puts err_dtl
      dbstate.close
    end
  end
end

class SqlAccess
  require 'sqlite3'
  require 'dalli'
  attr_reader :sites, :details
  def initialize(file)
    @db = SQLite3::Database.new(file) unless file.nil?
    @mm = Dalli::Client.new('localhost:11211')
  end
  define_method :read_data do |table,cols|
    mem_key = "#{table}_#{cols.gsub(',','_')}"
    if @mm.get(mem_key).nil?
       rows = []
      dbusing(@db) {
        @db.execute("select #{cols} from #{table}") do |row|
          rows << row
        end
      }
      self.instance_variable_set('@' + table,rows)
      @mm.set(mem_key,rows)     
    else
      self.instance_variable_set('@' + table,@mm.get(mem_key))
    end
  end
end

module RssAccess
  require 'rss'
  require 'rubygems'
  require 'active_record'
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'db/development.sqlite3',
    :timeout => 3000)
  class Detail < ActiveRecord::Base
  end
  define_method :details_renew do |sites_array,now_details|
    new_details = {}
    sites_array.each do |_sid,_rss|
      begin
        rss = RSS::Parser.parse(_rss,false)
        new_details[_sid] = rss.items
      rescue
        next
      end
    end
    new_details.each do |key,val|
      val.each do |item|
        unless now_details.include?(item.link)
          desc = item.respond_to?("description") ? item.description : ""
          detail = Detail.new
          detail.site_id = key
          detail.title   = item.title
          detail.message = desc
          detail.link    = item.link
          detail.save
        end
      end 
    end
  end
end

# class RssGetMain
  #Thread作成後はInitでDbアクセサ作っておく
  include RssAccess
  file    = 'db/development.sqlite3'
  sql_acc = SqlAccess.new(file)
  sql_acc.read_data("sites","id,rssurl")
  sql_acc.read_data("details","link")
  details_renew(sql_acc.sites,sql_acc.details)
# end
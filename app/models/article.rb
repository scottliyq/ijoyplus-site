#encoding: utf-8
class Article < ActiveRecord::Base
	belongs_to :category
end
#!/usr/bin/ruby

class Category < ActiveRecord::Base
    has_many :articles
    validates :slug, :uniqueness => true
    validates :name, :presence => true
end

class Article < ActiveRecord::Base
	validates :title, :presence => true
	validates :content, :presence => true
	belongs_to :category
	before_save :generate_slug


	private
	def generate_slug
		self.slug = Time.now.to_f.to_s.gsub(/[.|,]/, '')
	end
end

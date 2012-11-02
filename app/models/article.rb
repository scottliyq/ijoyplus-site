#encoding: utf-8
class Article < ActiveRecord::Base
	belongs_to :category, counter_cache: true
	attr_accessible :title, :content, :posted, :category_id, :slug

	validates :category_id, presence: true
	validates :title, :presence => true
	validates :content, :presence => true, :length => { maximum:400000}
	before_save :generate_slug

	private
	def generate_slug
		self.slug = SecureRandom.uuid if self.slug.blank?
	end
end
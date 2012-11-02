#encoding: utf-8
class Category < ActiveRecord::Base
	has_many :articles
	attr_accessible :name, :slug

  validates :name, :presence => true
  before_save :generate_slug

	private
	def generate_slug
		self.slug = SecureRandom.uuid if self.slug.blank?
	end
end
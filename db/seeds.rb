# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@cate1 = Category.create(:name => 'category 1')
@cate2 = Category.create(:name => 'category 2')

(1..30).each do |i|
	Article.create(:category_id => @cate1.id, :title => "here is the news of ##{i}", :content => "hello world ##{i}")
	Article.create(:category_id => @cate2.id, :title => "here is the news of ##{i}", :content => "hello world ##{i}")
end
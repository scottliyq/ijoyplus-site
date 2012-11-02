#!/usr/bin/ruby

2.times do |index|
	Category.create(:slug => "cat#{index}", :name => "Category #{index}")
end

3.times do |index|
	Article.create!(:slug => "news_#{index}", :title => 'welcome to Shanghai', :content => 'here we go', :category_id => index)
end
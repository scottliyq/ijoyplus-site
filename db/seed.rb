#!/usr/bin/ruby

3.times do |index|
	Article.create!(:slug => "news_#{index}", :title => 'welcome to Shanghai', :content => 'here we go')
end
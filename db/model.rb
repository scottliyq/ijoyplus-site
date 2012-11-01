#!/usr/bin/ruby

class Category < ActiveRecord::Base
    has_many :articles
end

class Article < ActiveRecord::Base
end

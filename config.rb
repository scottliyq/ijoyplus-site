###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

###
# AR and Models
###
set :db, 'db/site.db'

require 'active_record'
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => db
)

require 'db/model'
unless File.exists?(db)
  require 'db/migrate' 
  require 'db/seed'
end



# -----------------------------
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  if Article.count > 0
    Article.all.each do |article|
      page "/news/#{article.slug}.html", :proxy => "templates/news.html", :ignore => true, :locals => {:title => article.title, :content => article.content} 
    end
  end

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path - only work when not relative_assets
  # set :http_path, "/Content/images/"

  # specify assets host
  # activate :asset_host
  # set :asset_host do |asset|
  #   "http://assets%d.example.com" % (asset.hash % 4)
  # end
end
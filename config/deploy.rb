set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :application, "terrier"
set :repository,  "git://github.com/scottliyq/ijoyplus-site.git"
set :branch, "master"
set :user, "gits"
set :use_sudo, false
set :scm, :git

set :deploy_to, "/home/gits/www/terrier"
set :current_path, "#{deploy_to}/current"
set :releases_path, "#{deploy_to}/releases/"
set :shared_path, "#{deploy_to}/shared"
set :maintenance_template_path, "public/update.html"
set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require "bundler/capistrano"

set :whenever_environment, defer { stage }
require "whenever/capistrano"

set :application, "terrier"
set :repository,  "scm@project.diggerlab.com:terrier.git"
set :branch, "master"
set :user, "webuser"
set :use_sudo, false
set :scm, :git

set :deploy_to, "/home/webuser/www/terrier"
set :current_path, "#{deploy_to}/current"
set :releases_path, "#{deploy_to}/releases/"
set :shared_path, "#{deploy_to}/shared"
set :maintenance_template_path, "public/update.html"
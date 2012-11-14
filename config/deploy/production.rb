set :rails_env, "production" 
set :bundle_without, [:darwin, :development, :test]

role :web, "192.168.1.140"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.140"                          # This may be the same as your `Web` server
role :db, "192.168.1.140", :primary => true

set :branch, "master"

namespace:deploy do
    namespace:web do 
        task:start do
        end

        task:stop do
        end

        after "deploy:restart", :roles => :app do
            #add any tasks in here that you want to run after the project is deployed
            run "rm -rf #{release_path}.git"
            run "chmod -R 755 #{current_path}"

            run "ln -s #{shared_path}/uploads #{current_path}/public/uploads"
            run "touch #{File.join(current_path,'tmp','restart.txt')}"

        end
    end
end


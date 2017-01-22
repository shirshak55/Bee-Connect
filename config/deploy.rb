# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "chat_ounce"
set :repo_url, "git@bitbucket.org:bloggervista/chat-ounce.git"

set :deploy_to, '/home/shirshak/chat_ounce'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end
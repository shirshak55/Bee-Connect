# config valid only for current version of Capistrano
lock "3.7.1"

set :application, "chat_ounce"
set :repo_url, "git@bitbucket.org:bloggervista/chat-ounce.git"

set :deploy_to, '/home/shirshak/chat_ounce'

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
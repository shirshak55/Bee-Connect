source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  gem 'sqlite3'
  gem 'meta_request'
  gem 'web-console'
  gem "awesome_print", require:"ap"
end
group :production do
  gem 'mysql2', '~> 0.4.5'
end

gem 'haml'
gem 'paperclip'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'devise'
gem 'acts_as_votable'
gem 'kaminari'

gem 'rails_admin'

gem 'remotipart', '~> 1.2'
gem 'sidekiq'
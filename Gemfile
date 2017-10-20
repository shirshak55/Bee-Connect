source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

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

group :development, :test do
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'fuubar', '~> 2.2.0'
  gem 'database_cleaner', '~> 1.6'
  gem 'factory_girl_rails', '~> 4.6'
  gem 'faker', '~> 1.7'
  gem 'shoulda', '~> 3.5.0'
  gem 'simplecov', '~> 0.14', require: false
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

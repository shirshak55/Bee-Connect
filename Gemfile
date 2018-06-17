# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

### Servers
gem 'rails', '~> 5.2'

gem 'pg'
gem 'puma', '~> 3.0'
gem 'redis', '~> 3.0'
gem 'sidekiq'

### Front End
gem 'acts_as_votable'
gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'paperclip'
gem 'rails_emoji_picker'
gem 'remotipart', '~> 1.2'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'

### Utilities
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'rails_admin'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  gem 'awesome_print', require: 'ap'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-rspec'
  gem 'irbtools-more', require: 'irbtools/binding'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'meta_request'
  gem 'web-console'
end

group :development, :test do
  gem 'bullet', '~> 5.6'
  gem 'bundler-audit', '~> 0.6', require: false
  gem 'capybara', '~> 3.1'
  gem 'chromedriver-helper', '~> 1.1.0'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.49', require: false
  gem 'rubocop-rspec', '~> 1.12', require: false
  gem 'selenium-webdriver'
  # gem 'spring'
  # gem 'spring-commands-rspec'
  # gem 'spring-watcher-listen'
end

group :test do
  gem 'brakeman', '~> 3.5', require: false
  gem 'capybara-email'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.7'
  gem 'fuubar', '~> 2.2.0'
  gem 'metric_fu', '~> 4.12.0', require: false
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers', branch: 'master'
  gem 'simplecov', '~> 0.14', require: false
  gem 'simplecov-console', require: false
  gem 'test-prof'
end

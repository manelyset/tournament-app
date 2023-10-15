source "https://rubygems.org"

ruby "2.7.2"

gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "pg"
gem "puma", ">= 5.0"
gem "bootsnap", require: false

group :development, :test do
  gem "pry-byebug"
  gem "erb_lint", require: false
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem "rspec"
  gem 'rspec-rails', require: false
end

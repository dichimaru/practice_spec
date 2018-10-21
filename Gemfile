source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

# Framework
gem "rails", "~> 5.2.1"
gem "webpacker"
gem "sass-rails"
gem "uglifier"

# Database
gem "mysql2", ">= 0.4.4", "< 0.6.0"

# Server
gem "puma", "~> 3.11"

# Views
gem "haml-rails"


# Performance
gem "bootsnap", ">= 1.1.0", require: false


# Views
gem "haml-rails"

# CSS
gem "bootstrap", "~> 4.0.0"
gem "font-awesome-sass", "~> 5.0.6"

# Database seed
gem "seed-fu"

group :development, :test do
  gem "byebug"
  gem "pry-byebug"
  gem "pry-rails"

  # Lint tools
  gem "rubocop", require: false
  gem "haml_lint"

  # Data create
  gem "factory_bot_rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "xray-rails"
  gem "bullet"
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

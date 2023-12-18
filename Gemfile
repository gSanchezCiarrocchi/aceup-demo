source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 6.1.7', '>= 6.1.7.6'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "interactor", "~> 3.0"
gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails', '~> 6.0', '>= 6.0.3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'shoulda-matchers', '~> 5.3'
  gem 'factory_bot_rails'
end

group :development do
  gem 'spring'
end

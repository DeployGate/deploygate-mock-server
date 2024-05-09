source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: '.ruby-version'

gem 'sinatra', '~> 3.2'
gem 'rackup', '~> 1.0'
gem 'thin', '~> 1.8'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

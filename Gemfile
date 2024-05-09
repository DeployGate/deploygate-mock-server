source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: '.ruby-version'

gem 'sinatra', '~> 4.0'
gem 'rackup', '~> 2.1'
gem 'puma', '~> 6.4', '>= 6.4.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

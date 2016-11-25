source 'https://rubygems.org'


gem 'rails', '4.2.7'

gem 'rails-api'

gem 'spring', :group => :development


gem 'pg'

gem 'activerecord-postgres-earthdistance'

gem 'geocoder'


group :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.1'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false #Code coverage analysis tool, integrates with rspec
end

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'irbtools-more', require: 'irbtools/binding'
end
source 'https://rubygems.org'

#ruby '2.1.0'

gem 'rails', '4.1.2'
gem 'sqlite3', group: :development
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'node', '~> 0.0.2'
gem 'haml'
gem 'simple-navigation'

#gem 'spring', group: :development

group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'guard-cucumber'
end

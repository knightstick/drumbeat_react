source 'https://rubygems.org'

ruby '2.2.0'

### Rails default gems
### ==================
gem 'rails', '4.2.0'
# gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring', '~>1.3.3'
end

### Custom gems
### ===========

### Server and Database
### ===================
gem 'pg'
gem 'rails_12factor', group: :production
gem 'unicorn-rails'
gem 'foreman'

### Front-end
### =========
gem 'bootstrap-sass'

### Back-end
### ========
gem 'devise'
gem 'simple_token_authentication', '~> 1.0'

### Admin
### =====
gem 'activeadmin', github: 'activeadmin'
gem 'flattened_active_admin'

### Api Calls
### =========
gem 'active_model_serializers'

### Development
### ===========
group :development, :test do
  gem 'guard'
  # gem 'guard-spring'
  gem 'guard-livereload', require: false
  gem 'guard-bundler', require: false
  gem 'quiet_assets'

  gem 'rspec-rails', '~> 3.0'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner', '>= 0.9.1'

  gem 'better_errors'
  gem 'pry-rails'

  gem 'annotate', '~> 2.6.5'
  gem 'letter_opener'
  gem 'rubocop'

  # Generate controllers and doc(k)s with ease!
  gem 'harbourmaster'
end

group :test do
  gem 'shoulda-matchers', require: false
end

### React etc.
### ==========
gem 'react-rails', '~> 1.0'

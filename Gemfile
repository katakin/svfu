source 'http://mirror1.prod.rhcloud.com/mirror/ruby/'
#source 'https://rubygems.org'
gem 'rails', '3.2.13'
gem 'oj'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'mysql2'
end

group :test do
	gem "capybara", ">= 2.0.3"
	gem "database_cleaner", ">= 1.0.0.RC1"
	gem "email_spec", ">= 1.4.0"
end

group :development do
	gem "quiet_assets", ">= 1.0.2"
end

group :development, :test do
	gem "rspec-rails", ">= 2.12.2"
	gem "factory_girl_rails", ">= 4.2.0"
	gem 'sqlite3'
end

gem 'jquery-rails'

# gem "cucumber-rails", ">= 1.3.1", :group => :test, :require => false
# gem "launchy", ">= 2.2.0", :group => :test

gem 'bootstrap-sass', '~> 2.3.1.0'
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.1.0"
gem "russian", ">= 0.6.0"
gem "select2-rails"
# gem "figaro", ">= 0.6.3"
# gem "better_errors", ">= 0.7.2", :group => :development
# gem "binding_of_caller", ">= 0.7.1", :group => :development, :platforms => [:mri_19, :rbx]
# gem "libv8", ">= 3.11.8"
# gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"
gem 'activerecord-reset-pk-sequence'
# gem 'cocoon'

# This version needs to be hardcoded for OpenShift compatibility
gem 'thor', '= 0.14.6'

# This needs to be installed so we can run Rails console on OpenShift directly
gem 'minitest'

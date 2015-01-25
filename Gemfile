source 'https://rubygems.org'

gem "thin"
gem 'omniauth-facebook'
gem 'twilio-ruby', '~> 3.11'
gem 'kaminari'
gem "paperclip"
gem "aws-sdk"
gem "figaro"
gem "rails_12factor"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
gem "quiet_assets", group: :development
gem 'pg_search'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'actionmailer', '4.1.1'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'backbone-on-rails'
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development do

  gem 'letter_opener'
  # Run 'annotate' in Terminal to add helpful comments to models.
  gem 'annotate'
  # These two give you a great error handling page.
  # But make sure to never use them in production!
  gem 'better_errors'
  gem 'binding_of_caller'
  # Gotta have debugger...
  gem 'debugger'
  # pry > irb
  gem 'pry-rails'

end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'guard-rspec'
  gem "shoulda-matchers"
  gem 'faker'
  gem 'capybara'
  gem 'launchy'

end



gem "nokogiri", '1.6.1'
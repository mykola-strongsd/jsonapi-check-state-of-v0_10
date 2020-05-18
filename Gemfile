source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'rails', '~> 6.0.3'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'rubocop', '~> 0.75.0', require: false
  gem 'rubocop-junit-formatter'
  gem 'rubocop-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'json_spec', '1.1.5'
  gem 'pry-byebug'
  gem 'rspec'
  gem 'rspec-core'
end


gem 'pundit'

# gem 'jsonapi-authorization', :git => 'https://github.com/lgebhardt/jsonapi-authorization.git', :branch => 'v0_10'
gem 'jsonapi-authorization', :git => 'https://github.com/mykola-strongsd/jsonapi-authorization.git', :branch => 'v0_10'

gem 'jsonapi-resources', :git => 'https://github.com/cerebris/jsonapi-resources.git', :branch => 'use_records_for_joined_resources'
# gem 'jsonapi-resources', :git => 'https://github.com/mykola-strongsd/jsonapi-resources.git', :branch => 'use_records_for_joined_resources'

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Core ruby/rails versions
ruby '2.5.1'
gem 'rails', '~> 5.2.1'

# Main backend gems
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Main frontend gems
gem 'jbuilder', '~> 2.5'
gem 'webpacker'

# Misc gems
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.18'
  gem 'erb_lint'
  gem 'factory_bot_rails', '~> 4.8'
  gem 'rails-controller-testing'
  gem 'reek', '~> 5.0'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop'
  gem 'scss_lint'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

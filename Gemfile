source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'haml'
gem 'html2haml'
gem 'will_paginate'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem "breadcrumbs_on_rails"
gem 'bootstrap_form'
gem 'figaro'
gem 'faker'
gem 'paperclip'
gem 'stripe'
gem 'placekitten'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
  gem 'capybara', '~> 2.13.0'
  # gem 'stripe-ruby-mock', '~> 2.4.1', :require => 'stripe_mock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

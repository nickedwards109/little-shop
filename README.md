# Little Shop
This is an open-source e-commerce app that you can clone and deploy for free!

## Prerequisites
This app uses Ruby 2.3.1, Rails 5.1.1, Postgres, and more. All other dependencies are included in the Gemfile.

## Getting Started
 - Clone this repo to your local machine
 - Navigate to the project root directory
 - Run `bundle install` and then `rails db:setup` and then `rails s` to be up and running!

## Running the tests
This app contains comprehensive feature tests and unit tests.
From the project root, run `rspec` to run the entire test suite.
You can also pick an individual test from the /spec directory and run it like this: `rspec spec/features/orders/authenticated_user_can_place_order_spec.rb`

## Deployment
 - On a Mac, install the Heroku CLI with `brew install heroku`
 - Create a Heroku account and login from the command line with `heroku login`
 - Run `heroku create`
 - Ensure that you are on the master branch with `git branch`
 - Precompile assets for production with `rake assets:precompile`
 - Commit those changes to your master branch
 - Run `git push heroku master`
 - Run `heroku run rake db:migrate`
 - Create a Stripe account. Set your Stripe API keys with `heroku config:set PUBLISHABLE_KEY=your_key SECRET_KEY=your_key`
 - Create an admin user with `heroku run rails console` followed by `User.create(name: "your name", username: "your username", password: "your password", role: "admin")`. Exit out of the Rails console.
 - Verify the URL to your deployment with `heroku domains`
 - Log in with your admin credentials to start creating items for sale!

## Features
 - Comprehensive test suite with Capybara and RSpec
 - Authentication of users with `has_secure_password`
 - Authorization for restricted access to admin role features
 - Styling with customized Bootstrap CSS
 - Templating with HAML
 - CRUD of items and orders
 - Image uploading with Paperclip
 - Filtering items by category
 - Searching items and categories
 - Shopping cart functionality
 - Checkout with Stripe

## License
This project is licensed under the terms of the MIT license, as outlined in License.txt

## Authors
This app was authored by Alex Koch, Bao Nguyen, and Nick Edwards as a requirement for the Back-End Engineering Program at the Turing School of Software and Design.

## Our Development Workflow
We used Test-Driven Development throughout this project. We adhered to a collaborative Git workflow that enabled us each to work independently as part of a team. We used Critical Path Methods as part of our project management strategy, which enabled us to divide work effectively among the team and complete all requirements several days ahead of schedule.

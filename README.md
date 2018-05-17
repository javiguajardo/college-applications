# College Applications

This is a Rails app for high school students that wish to apply to a US college. It lets college administrators view and manage these applications.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This app has been tested using the following dependencies.

* Ruby 2.5.1
* Rails 5.2.0
* Postgres 10
* ChromeDriver 2.38.552518 (used for Capybara tests)

Installation for ChromeDriver was done using Homebrew.

```
brew install chromedriver
```

### Installing

After downloading the repo, gem dependencies should be installed.

```
gem install bundler
```

Then...

```
bundle install
```

To setup the database.

```
rails db:create:all
rails db:migrate
rails db:seed
```

## Running the tests

Testing was done using the RSpec and Capybara gems. All tests live under the /spec directory.

To run the tests.

```
rspec
```

## Deployment

Deployment was done using Heroku. Installation instructions for Heroku can be found in the following link.

https://devcenter.heroku.com/articles/getting-started-with-rails5

The app has been deployed to the following domain.

https://college-applications.herokuapp.com/

To add the remote to your application copy.

```
git remote add heroku https://git.heroku.com/college-applications.git
```

# Physisister Website
[![Maintainability](https://api.codeclimate.com/v1/badges/9351176a12d6f8025854/maintainability)](https://codeclimate.com/github/Physisister/website/maintainability)

[![TestCoverage](https://api.codeclimate.com/v1/badges/9351176a12d6f8025854/test_coverage)](https://codeclimate.com/github/Physisister/website/test_coverage)

## Tech Stack

#### Written in
* Ruby 2.5.0
* HTML
* CSS

#### Testing
* Rspec - testing framework
* SimpleCov - coverage

#### Frameworks
* Ruby on Rails

## Getting started

You can find the app on [Heroku](https://physisister.herokuapp.com/)

Alternatively:
1. Clone the repository
2. Setup the databases:
```bash
> bundle install
> rails db:create
> rails db:migrate
```
3. Start the server
```bash
> rails server
```

## Running the tests

Simply run:
```bash
> rspec
```

#### Code coverage:
In the test report you should get a value for the coverage. To get a more detailed analysis of the coverage:
```bash
> cd coverage
> open index.html
```

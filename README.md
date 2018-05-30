# Physisister Website

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

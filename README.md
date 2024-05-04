# Stack Builders Coding Exercise

This exercise was performed as part of the recruitment process to join Stack Builders. It consists of a web crawler that fetches the first 30 entries of [this web page](https://news.ycombinator.com/) and performs various filtering operations.

It was built using pure Ruby classes and tested with RSpec test library (along with [WebMock](https://github.com/bblimke/webmock) & [VCR](https://github.com/vcr/vcr) to avoid HTTP requests when running the test suite).

## Installation

I used Ruby version 3.2.3 managed with managed with [RVM](https://rvm.io/). To install this project simply clone this repository and run the following command inside it:

```
bundle install
```

## Usage

Run the main file, that will crawl the first 30 entries and perform filtering operations with them:

```
ruby main.rb
```

Run the test suite:

```
bin/rspec
```

Run Rubocop linter:

```
bin/rubocop
```

Open a developer console for testing purposes:

```
bin/console
```

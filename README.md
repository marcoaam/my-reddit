[![Code Climate](https://codeclimate.com/github/marcoaam/my-reddit/badges/gpa.svg)](https://codeclimate.com/github/marcoaam/my-reddit) [![Test Coverage](https://codeclimate.com/github/marcoaam/my-reddit/badges/coverage.svg)](https://codeclimate.com/github/marcoaam/my-reddit)

My Reddit
=========

Week 9 test at Makers Academy. Reddit clone.

Objectives of this test
-----------------------

To implement the knowledge acquired in Rails, putting focus in application design using testing tools as Capybara with RSpec.

Technologies used:
------------------

- Ruby
- Rails, '4.1.4'
- HTML5
- CSS
- JavaScript
- JQuery
- Capybara
- RSpec
- Warden
- Devise
- Database Cleaner
- PostgreSQL
- Poltergeist
- Bootstrap


How to setup and use
------------

	git clone git@github.com:marcoaam/my-reddit.git
	cd my-reddit
	bundle install
	bin/rake db:create
	bin/rake db:migrate
	bin/rails server

visit in your browser  http://localhost:3000/


How to test
------------

	cd my-reddit
	rspec

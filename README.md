# bidclub

Bidclub is running on Heroku at http://bidclub.herokuapp.com/

If you want to run it locally:

Install Postgres locally:
* Install Postgres if you haven't `brew install postgres`

Setup Bidclub db:
* Run the Postgres service `pg_ctl -D "/usr/local/var/postgres" start`
* Initialize a db `initdb /usr/local/var/postgres`
* Create the tables `bundle exec rake db:create`
* Run the migrations `bundle exec rake db:migrate`
* Set up test db `rake db:test:prepare` (run this anytime you update the development database so the test database mirrors production

Launch the app using Sinatra:
`ruby app.rb`


When you're done:
* Shut down db `pg_ctl stop`
* Stop the app `ctrl-C`

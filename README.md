# bidclub

Bidclub is running on Heroku at http://bidclub.herokuapp.com/

If you want to run it locally:

Install Postgres locally:
* Install Postgres if you haven't `brew install postgres`
* Initialize a db `initdb /usr/local/var/postgres`

Run Postgres DB locally
* Run the Postgres service `pg_ctl -D "/usr/local/var/postgres" start`

Run the front-end:
`ruby app.rb`

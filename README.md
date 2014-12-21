# Implementing Twitter Sign with Torii Example

This Ember app demos how to implement twitter sign in with Torii.

## Tutorial

There is an article about it on Sitepoint.

## How to Run this App

* Get your key, and secret from [twitter](https://apps.twitter.com/).
* Add them to your environment `$ export TWITTER_KEY=twitter_key TWITTER_SECRET=twitter_secret`
* Install gems `bundle`
* Setup database `rake db:migrate`
* Build ember application
  - Go to public folder `cd public`
  - Install dependencies `npm install && bower install`
  - Build application `ember build`
* Run Sinatra app `rackup`
* Visit `127.0.0.1:9292`

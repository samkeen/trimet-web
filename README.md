# Trimet Arrivals Web App

[![Build Status](https://travis-ci.org/samkeen/trimet-web.png?branch=master)](https://travis-ci.org/samkeen/trimet-web)

Building an API around the Trimet [Arrivals Web Service](http://developer.trimet.org/ws_docs/arrivals_ws.shtml)
(see Transit module at lib/transit)

This is also Web Service of its own in the form of a Sinatra app.

Currently it only offers one end point: `http://localhost:4567/stop/{a trimet stop Id}`
But the plan is to expand in the endpoints presented.

## Install

```
$ bundle install

$ cp config.dist.yaml config.yaml
```

Get your [Trimet API Key](http://developer.trimet.org/registration/) and write to config.yml `api_key`

```
$ ruby app.rb
[2014-02-17 17:05:13] INFO  WEBrick 1.3.1
[2014-02-17 17:05:13] INFO  ruby 2.0.0 (2013-11-22) [x86_64-darwin12.5.0]
== Sinatra/1.4.4 has taken the stage on 4567 for development with backup from WEBrick
[2014-02-17 17:05:13] INFO  WEBrick::HTTPServer#start: pid=29368 port=4567
```

You should then be able to request `http://localhost:4567/stop/{a trimet stop Id}` and get the arrivals listing
for that Stop Id

## Tests

CI is hosted at Travis : https://travis-ci.org/samkeen/trimet-web

To run tests locally

```
$ rake
```

## Documentation

Hosted on [rubydoc.info](http://rubydoc.info/github/samkeen/trimet-web/)

To create docs locally

```
$ rake docs
```

# Trimet Arrivals Web App

[![Build Status](https://travis-ci.org/samkeen/trimet-web.png?branch=master)](https://travis-ci.org/samkeen/trimet-web)

Just starting, not ready for use yet.  I plan to host at pdxt.org eventually.

## Install

```
bundle install

cp config.dist.yaml config.yaml
```

Get your Trimet API Key and write to config.yml `api_key`

```
ruby app.rb
```

## Tests

CI is hosted at Travis : https://travis-ci.org/samkeen/trimet-web

To run tests locally

```
rake
```

## Documentation

Hosted on [rubydoc.info](http://rubydoc.info/github/samkeen/trimet-web/)

To create docs locally

```
rake docs
```

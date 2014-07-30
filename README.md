## Overview

A simple ruby script to 

## How To Use

1. Clone the repo
1. `bundle install`
1. Create a file called 'yelp.yml' and add Twitter API credentials as layed out as below
1. `ruby yelp_single.rb search_term search_location`

## Notes

+ Both 'search_term' and 'search_location' should use '+' instead of ' '

## yelp.yml

`credentials:
  consumer_key: ...
  consumer_secret: ...
  token: ...
  token_secret: ...`
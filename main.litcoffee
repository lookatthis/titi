# TiTi

Time tilbud 

# Task

- remaining pages
- data model, - what data is needed
- connect db to pages
- data subscriptions

# Data 

- user
    - preferredshops
    - saved events/deals
    - bought deals
- events/deal
    - event or deal
    - map
    - when start and end
    - title
    - description
    - deal: rabat
    - deal: price
    - deal: shop
    - image
    - published
- shop
    - default map position
    - address
    - name
    - logo

# Template oversigt

- landing page with list of events and offers for user
- single offer view
- company dashboard: listCompanyEvents + add event
- editEvent
    - company
    - product
    - description
    - reduction
    - price
    - starttime
    - endtime


# Code

## Databases

    Users = new Meteor.Collection("users");
    Events = new Meteor.Collection("events");
    Shops = new Meteor.Collection("shops");

    Meteor.startup ->
        console.log "hello"

    if Meteor.isClient
        Template.main.date = ->
            "05.31."

# Authors

- http://lookatthis.dk - business model, content
- http://gored.hu - html/css
- http://rasmuserik.com - backend

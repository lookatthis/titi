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

- timetilbud - landing page and list of offers by time
    - date
    - events: `{"18:00 - 19:00": [{_id: "id", image: "url", title: "title", description: "description", isEvent: true}]}`
- showEvent - single event view
- manageEvents - list of events to edit
    - events: `{"18:00 - 19:00": [{_id: "id", image: "url", title: "title", description: "description", isEvent: true}]}`
- editEvent


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
- http://gored.hu - html, css
- http://rasmuserik.com - scripting, html, and backend

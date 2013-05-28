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
    - events: `{"18:00 - 19:00": [{_id: "id", image: "url", title: "title", desc: "description", isEvent: true}]}`
- showEvent - single event view
- manageEvents - list of events to edit
    - events: `{"18:00 - 19:00": [{_id: "id", image: "url", title: "title", desc: "description", isEvent: true}]}`
- editEvent


# Code

    Events = new Meteor.Collection("events");

    if Meteor.isClient 
        Template.timetilbud.date = ->
            "05.31."

dummy event data for rendering test

        Template.timetilbud.events = -> [ { when: "18:00 - 19:00", entries: [ {_id: "a", image: "url", title: "Event 1", desc: "some desc 1", isEvent: true}, {_id: "b", image: "url", title: "Tilbud 1", desc: "some desc 2"}, {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"} ] }, { when: "19:00 - 20:00", entries: [ {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"}, {_id: "d", image: "url", title: "Tilbud 3", desc: "some desc 4"} ] }, { when: "20:00 - 21:00", entries: [ {_id: "b", image: "url", title: "Tilbud 1", desc: "some desc 2"}, {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"}, {_id: "d", image: "url", title: "Tilbud 3", desc: "some desc 4"} ] }, { when: "21:00 - 22:00", entries: [ {_id: "e", image: "url", title: "Event 2", desc: "some desc 5"} ] } ]

# Authors

- http://lookatthis.dk - business model, content
- http://gored.hu - html, css
- http://rasmuserik.com - scripting, html, and backend

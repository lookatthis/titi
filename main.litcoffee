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

    times = [
        "18:00 - 19:00", 
        "19:00 - 20:00", 
        "20:00 - 21:00", 
        "21:00 - 22:00", 
        "22:00 - 23:00", 
        "23:00 - 24:00", 
    ]

    Events = new Meteor.Collection("events");
    this.Events = Events

    if Meteor.isClient 
        Template.timetilbud.date = ->
            "05.31."

dummy event data for rendering test

        #Template.timetilbud.offers = -> [ { when: "18:00 - 19:00", entries: [ {_id: "a", image: "url", title: "Event 1", desc: "some desc 1", isEvent: true}, {_id: "b", image: "url", title: "Tilbud 1", desc: "some desc 2"}, {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"} ] }, { when: "19:00 - 20:00", entries: [ {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"}, {_id: "d", image: "url", title: "Tilbud 3", desc: "some desc 4"} ] }, { when: "20:00 - 21:00", entries: [ {_id: "b", image: "url", title: "Tilbud 1", desc: "some desc 2"}, {_id: "c", image: "url", title: "Tilbud 2", desc: "some desc 3"}, {_id: "d", image: "url", title: "Tilbud 3", desc: "some desc 4"} ] }, { when: "21:00 - 22:00", entries: [ {_id: "e", image: "url", title: "Event 2", desc: "some desc 5"} ] } ]

        Template.timetilbud.offers = -> getEvents()

        Template.timetilbud.events
            "click .eventLink": ->
                Session.set("currentOffer", this)
                location.hash = "#showEvent"

        Template.manageEvents.events
            "click .eventLink": ->
                Session.set("currentOffer", this)
                location.hash = "#editEvent"

        this.getEvents = ->
            result = {}
            Events.find().forEach (event) ->
                times = []
                for time in [+event.starttime..+event.endtime-1] by 1
                    times.push "#{time}:00 - #{time+1}:00"
                times.push "invalid timespan" if times.length is 0
                for time in times
                    result[time] = [] if not result[time]
                    result[time].push(event)
            {when: key, entries: val} for key, val of result


        Template.showEvent.offer = ->
            offer = Session.get "currentOffer"
            console.log offer
            offer

        Template.editEvent.times = -> times

        Template.editEvent.events
            "click .saveEvent": ->
                obj = 
                    isEvent: $("#typeIsEvent")[0].checked
                    title: $(".product").val()
                    desc: $(".desc").val()
                    reduction: $(".reduction").val()
                    price: $(".price").val()
                    starttime: $(".starttime").val()
                    endtime: $(".endtime").val()
                obj._id = this._id if this._id
                if obj._id
                    Events.update {_id: obj._id}, obj
                else
                    Events.insert obj
# Authors

- http://lookatthis.dk - business model, content
- http://gored.hu - html, css
- http://rasmuserik.com - scripting, html, and backend

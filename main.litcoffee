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

        Template.timetilbud.offers = -> getEvents()
        Template.manageEvents.offers = -> getEvents()

        Template.timetilbud.events
            "click .eventLink": ->
                Session.set("currentOffer", this)
                $.mobile.changePage "#showEvent"

        Template.timetilbud.events
            "click .eventLink": ->
                Session.set("currentOffer", this)
                $.mobile.changePage "#showEvent"

        Template.manageEvents.events
            "click .eventLink": ->
                Session.set("currentOffer", this)
                $.mobile.changePage "#editEvent"

        Template.manageEvents.events
            "click .newEvent": ->
                Session.set("currentOffer", {})
                $.mobile.changePage "#editEvent"

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
            result = ({when: key, entries: val} for key, val of result)
            result.sort (a, b) -> if a.when < b.when then -1 else 1
            result


        Template.showEvent.offer = ->
            offer = Session.get "currentOffer"
            console.log offer
            offer

        Template.editEvent.times = -> times

        Template.editEvent.offer = -> 
            offer = Session.get "currentOffer"
            console.log "ed", offer
            offer


        Template.editEvent.events
            "click .deleteEvent": ->
                id = (Session.get "currentOffer")._id
                if id then Events.remove {_id: id}
                $.mobile.changePage "#manageEvents"
            "click .saveEvent": ->
                obj = 
                    isEvent: $("#typeIsEvent")[0].checked
                    title: $(".product").val()
                    desc: $(".desc").val()
                    reduction: $(".reduction").val()
                    price: $(".price").val()
                    starttime: $(".starttime").val()
                    endtime: $(".endtime").val()
                id = (Session.get "currentOffer")._id
                obj._id = id if id
                if id
                    Events.update {_id: id}, obj
                else
                    Events.insert obj
                $.mobile.changePage "#manageEvents"
# Authors

- http://lookatthis.dk - business model, content
- http://gored.hu - html, css
- http://rasmuserik.com - scripting, html, and backend

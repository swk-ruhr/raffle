#!/usr/bin/env groovy

import groovy.json.JsonSlurper

def eventId = '<INSERT MEETUP EVENT ID HERE>'
def uri = "https://api.meetup.com/Softwerkskammer-Ruhrgebiet/events/${eventId}/rsvps"

def rsvps = new JsonSlurper().parse(uri.toURL())

List<String> attendees = rsvps.member.name

def random = new Random(System.currentTimeMillis())

def reader = System.in.newReader()

println "Press [Enter] to draw the next winner!"

while (reader.readLine() != null) {
    int size = attendees.size()
    def winnerIndex = random.nextInt(size)
    def winner = attendees.remove(winnerIndex)
    println winner
}

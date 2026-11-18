
Feature: List and filter bookings

  Background:
    * url baseUrl

  Scenario: Get all booking IDs
    Given path 'booking'
    When method get
    Then status 200
    And match response == '#[]'

  Scenario: Filter bookings by firstname and lastname
    * def newBooking = call read('classpath:helpers/create-booking.feature')
    Given path 'booking'
    And param firstname = newBooking.firstname
    And param lastname = newBooking.lastname
    When method get
    Then status 200
    And match response contains { bookingid: '#(newBooking.bookingId)' }

  Scenario: Filter bookings by checkin and checkout dates
    Given path 'booking'
    And param checkin = '2026-01-01'
    And param checkout = '2026-12-31'
    When method get
    Then status 200
    And match response == '#[]'

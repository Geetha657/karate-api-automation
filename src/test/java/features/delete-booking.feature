
Feature: Delete bookings

  Background:
    * def created = call read('classpath:helpers/create-booking.feature')
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Delete a booking with authentication
    * def auth = call read('classpath:helpers/auth-token.feature')
    * cookie token = auth.authToken
    Given path 'booking', created.bookingId
    When method delete
    Then status 201

  Scenario: Reject DELETE without authentication
    Given path 'booking', created.bookingId
    When method delete
    Then status 403

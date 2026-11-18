
Feature: Partially update bookings with PATCH

  Background:
    * def created = call read('classpath:helpers/create-booking.feature')
    * url baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Partially update a booking with authentication
    * def auth = call read('classpath:helpers/auth-token.feature')
    * cookie token = auth.authToken
    Given path 'booking', created.bookingId
    And request { firstname: 'UpdatedName', lastname: 'UpdatedLast' }
    When method patch
    Then status 200
    And match response.firstname == 'UpdatedName'
    And match response.lastname == 'UpdatedLast'

  Scenario: Reject PATCH without authentication
    Given path 'booking', created.bookingId
    And request { firstname: 'Unauthorized' }
    When method patch
    Then status 403

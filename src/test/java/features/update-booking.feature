
Feature: Full booking updates with PUT

  Background:
    * def created = call read('classpath:helpers/create-booking.feature')
    * def updated = { firstname: 'Geethanjali', lastname: 'Vasa', totalprice: 2500, depositpaid: true, bookingdates: { checkin: '2026-12-01', checkout: '2026-12-05' }, additionalneeds: 'Breakfast and Dinner' }
    * url baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Update booking with valid authentication
    * def auth = call read('classpath:helpers/auth-token.feature')
    * cookie token = auth.authToken
    Given path 'booking', created.bookingId
    And request updated
    When method put
    Then status 200
    And match response == updated

  Scenario: Reject update without authentication
    Given path 'booking', created.bookingId
    And request updated
    When method put
    Then status 403

  Scenario: Reject update of a nonexistent booking
    * def auth = call read('classpath:helpers/auth-token.feature')
    * cookie token = auth.authToken
    Given path 'booking', 999999999
    And request updated
    When method put
    Then status 405

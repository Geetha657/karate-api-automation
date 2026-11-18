
Feature: Retrieve a booking by ID

  Background:
    * def created = call read('classpath:helpers/create-booking.feature')
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Retrieve an existing booking
    Given path 'booking', created.bookingId
    When method get
    Then status 200
    And match response.firstname == created.firstname
    And match response.lastname == created.lastname

  Scenario: Retrieve a nonexistent booking
    Given path 'booking', 999999999
    When method get
    Then status 404


  Scenario: Validate booking price and dates
    Given path 'booking', created.bookingId
    When method get
    Then status 200
    And match response.totalprice == 1500
    And match response.bookingdates.checkin == '2026-12-01'
    And match response.bookingdates.checkout == '2026-12-05'

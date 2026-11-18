
Feature: Create bookings

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Create a valid booking
    * def booking = { firstname: 'Geethanjali', lastname: 'Vasa', totalprice: 1500, depositpaid: true, bookingdates: { checkin: '2026-12-01', checkout: '2026-12-05' }, additionalneeds: 'Breakfast' }
    Given path 'booking'
    And request booking
    When method post
    Then status 200
    And match response.bookingid == '#number'
    And match response.booking == booking

  Scenario: Reject booking with missing required fields
    Given path 'booking'
    And request { firstname: 'Geethanjali' }
    When method post
    Then status 500

  Scenario: Document API behavior for invalid totalprice
    Given path 'booking'
    And request { firstname: 'Geethanjali', lastname: 'Vasa', totalprice: 'not-a-number', depositpaid: true, bookingdates: { checkin: '2026-12-01', checkout: '2026-12-05' }, additionalneeds: 'Breakfast' }
    When method post
    Then status 200
    And match response.booking.totalprice == null

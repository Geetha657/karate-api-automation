
Feature: Reusable booking creation helper

  Scenario: Create a booking for another test
    * def firstname = 'QA' + java.util.UUID.randomUUID().toString().substring(0, 8)
    * def lastname = 'Test' + java.util.UUID.randomUUID().toString().substring(0, 4)
    Given url baseUrl
    And path 'booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request
    """
    {
      "firstname": "#(firstname)",
      "lastname": "#(lastname)",
      "totalprice": 1500,
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2026-12-01",
        "checkout": "2026-12-05"
      },
      "additionalneeds": "Breakfast"
    }
    """
    When method post
    Then status 200
    * def bookingId = response.bookingid

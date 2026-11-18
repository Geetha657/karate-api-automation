
Feature: Advanced response validation and data-driven tests

  Scenario: Validate booking response schema
    * def created = call read('classpath:helpers/create-booking.feature')
    Given url baseUrl
    And path 'booking', created.bookingId
    And header Accept = 'application/json'
    And retry until responseStatus == 200
    When method get
    Then status 200
    And match response ==
    """
    {
      firstname: '#string',
      lastname: '#string',
      totalprice: '#number',
      depositpaid: '#boolean',
      bookingdates: {
        checkin: '#string',
        checkout: '#string'
      },
      additionalneeds: '#string'
    }
    """

  Scenario Outline: Create bookings using multiple datasets
    Given url baseUrl
    And path 'booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { firstname: '<firstname>', lastname: '<lastname>', totalprice: <price>, depositpaid: true, bookingdates: { checkin: '2026-12-01', checkout: '2026-12-05' }, additionalneeds: 'Breakfast' }
    When method post
    Then status 200
    And match response.booking.firstname == '<firstname>'
    And match response.booking.totalprice == <price>

    Examples:
      | firstname | lastname | price |
      | Alice     | Smith    | 1200  |
      | Bob       | Jones    | 1800  |

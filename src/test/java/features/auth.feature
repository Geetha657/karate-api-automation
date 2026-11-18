
Feature: Booking API authentication

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'

  Scenario: Generate token with valid credentials
    Given path 'auth'
    And request { username: 'admin', password: 'password123' }
    When method post
    Then status 200
    And match response.token == '#string'

  Scenario: Reject invalid credentials
    Given path 'auth'
    And request { username: 'wronguser', password: 'wrongpass' }
    When method post
    Then status 200
    And match response.reason == 'Bad credentials'

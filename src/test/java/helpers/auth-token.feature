
Feature: Reusable authentication token helper

  Scenario: Generate an authentication token
    Given url baseUrl
    And path 'auth'
    And header Content-Type = 'application/json'
    And request { username: 'admin', password: 'password123' }
    When method post
    Then status 200
    * def authToken = response.token
    And match authToken == '#string'

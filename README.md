[![Karate API Automation Tests](https://github.com/Geetha657/karate-api-automation/actions/workflows/karate-tests.yml/badge.svg)](https://github.com/Geetha657/karate-api-automation/actions/workflows/karate-tests.yml)

# Karate API Automation Framework

A REST API test automation framework built using Karate DSL, Java 21, Maven, and JUnit 5.

## Technologies Used
- Karate DSL
- Java 21
- Maven
- JUnit 5
- Git and GitHub
- GitHub Actions CI/CD

## API Under Test
Restful-Booker API:
https://restful-booker.herokuapp.com

## Test Coverage
- GET: Retrieve and filter bookings
- POST: Create bookings
- PUT: Update existing bookings
- PATCH: Partially update bookings
- DELETE: Delete bookings
- Authentication: Generate and validate tokens
- Negative testing: Invalid requests and unauthorized operations
- Schema validation and data-driven testing

## Framework Features
- 21 API test executions
- Reusable feature files and helper functions
- Centralized configuration using karate-config.js
- Authentication token handling
- Dynamic test data generation
- HTML test reports
- Automated CI/CD using GitHub Actions

## Project Structure
src/test/java/
├── KarateTest.java
├── karate-config.js
├── features/
│   ├── auth.feature
│   ├── create-booking.feature
│   ├── delete-booking.feature
│   ├── get-booking-by-id.feature
│   ├── get-bookings.feature
│   ├── negative-tests.feature
│   ├── patch-booking.feature
│   └── update-booking.feature
└── helpers/
    ├── auth-token.feature
    └── create-booking.feature

## Running the Tests

Prerequisites:
- Java 21
- Maven

Clone the repository:

git clone https://github.com/Geetha657/karate-api-automation.git

Navigate to the project:

cd karate-api-automation

Run all tests:

mvn clean test

## Test Reports

After execution, open:

target/karate-reports/karate-summary.html

## CI/CD

GitHub Actions automatically executes the API tests on:
- Pushes to the main branch
- Pull requests targeting main
- Manual workflow triggers

Test reports are uploaded as workflow artifacts.

## Known Limitations

The public Restful-Booker demo API may occasionally return unexpected responses.

The PUT test validates the successful update response but does not currently verify persistence with a subsequent GET request.

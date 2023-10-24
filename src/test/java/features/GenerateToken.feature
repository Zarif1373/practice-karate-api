@Regression
Feature: Generate Token Feature

  Background: Setup test
    Given url BASE_URL

  Scenario: Validate /api/plans/get-all-plan-code
    Given path "/api/token"
    Given request {"username":"supervisor", "password":"tek_supervisor"}
    When method post
    Then status 200
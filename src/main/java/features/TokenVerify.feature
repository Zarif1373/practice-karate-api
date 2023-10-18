Feature: Security Token API calls

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Send request to /api/token
    And path "/api/token"
    And request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    And path "api/token/verify"
    And param username = "supervisor"
    And param token = response.token
    When method get
    Then status 200
    And print response
    And assert response.message == "Token is valid"

    Scenario: Send valid username invalid token to /api/token/verify
      And path "/api/token/verify"
      And param username = "supervisor"
      And param token = "Wrong token"
      When method get
      Then print response
      And status 400
      And assert response.errorMessage == "Token Expired or Invalid Token"

      # Activity Story 4)
  # Send invalid user and valid token
  # Response
  # And response contain mesage "Wrong username send along with Token"
  Scenario: Send request to /api/token
    And path "/api/token"
    And request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And path "api/token/verify"
    And param username = "wrongusername"
    And param token = response.token
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"


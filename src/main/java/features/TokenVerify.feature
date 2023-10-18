Feature: Security Token API calls

  Scenario: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
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
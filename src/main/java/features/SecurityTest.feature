Feature: Security Token API calls

  Scenario: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request {"username" : "supervisor", "password" : "tek_supervisor"}
    When method post
    Then status 200

    # Activity, try User Story 2)
  # Endpoint: /api/token
  # Test with wrong username
  # And status should be 404

  Scenario: Send request to /api/token
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request
    """
    {
    "username" : "WrongUsername",
    "password" : "tek_supervisor"
    }
    """
    When method post
    Then status 404
    And print response
    And assert response.httpStatus == "NOT_FOUND"
    And assert response.errorMessage == "User WrongUsername not found"

  Scenario: Send request to /api/token with wrong password
    Given url "https://qa.insurance-api.tekschool-students.com"
    And path "/api/token"
    And request
       """
    {
    "username" : "supervisor",
    "password" : "Wrong password"
    }
    """
    When method post
    Then print response
    Then status 400
    And assert response.httpStatus == "BAD_REQUEST"
    And assert response.errorMessage == "Password not matched"

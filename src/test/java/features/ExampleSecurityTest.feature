@Regression
Feature: Security Token API calls

  Scenario Outline: Send WrongUsername request to /api/token
    Given url BASE_URL
    And path "/api/token/"
    And request
"""
    {
    "username": "<data_username>",
    "password": "<data_password>"
    }
    """
    When method post
    And print response
    Then status <expectedStatus>
    And assert response.httpStatus == "<httpStatus>"
    And assert response.errorMessage == "<errorMessage>"

    Examples:
      | data_username | data_password  | expectedStatus | httpStatus  | errorMessage                 |
      | WrongUsername | tek_supervisor | 404            | NOT_FOUND   | User WrongUsername not found |
      | supervisor    | alohjfoaisero  | 400            | BAD_REQUEST | Password not matched         |
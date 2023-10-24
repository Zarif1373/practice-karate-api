@Regression
Feature: Create Account with Random Email using java

  Background: Setup test
    Given url BASE_URL

  Scenario: Create Valid account /api/accounts/add-primary-account
    Given path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail();
    * def firstName = dataGenerator.getFirstName();
    And request
    """
    {
      "email": "#(autoEmail)",
      "firstName": "#(firstName)",
      "lastName": "Shokriyan",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Instructor",
      "dateOfBirth": "1992-10-18"
     }
    """
    When method post
    Then print response
    Then status 201
    Then assert response.email == autoEmail

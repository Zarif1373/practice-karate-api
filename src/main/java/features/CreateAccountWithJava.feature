@Regression
Feature: Create Account with Random Email using java

  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"

  Scenario: Create Valid account /api/accounts/add-primary-account
    Given path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail();
    * def firstName = dataGenerator.getFirstName();
    And request
      """
      {
    "email": "#(autoEmail)",
    "title": "Mr.",
    "firstName": "#(firstName)",
    "lastName": "lakjsfl",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "SDET",
    "dateOfBirth": "1697743209152"
}
      """
    When method post
    Then status 201
    Then assert response.email == autoEmail

Feature: End to end account creation

  Background: Setup test
    Given url BASE_URL
    * def tokenResult = callonce read('GenerateToken.feature')
    * def token = "Bearer " + tokenResult.response.token

    @End2End
  Scenario: Create Account end to end
    Given path "/api/accounts/add-primary-account"
    * def dataGenerator = Java.type('data.DataGenerator')
    * def autoEmail = dataGenerator.getEmail();
    And request
    """
    {
  "email": "#(autoEmail)",
  "firstName": "asfd",
  "lastName": "David",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Actor",
  "dateOfBirth": "1990-10-23",
}
    """
    And header Authorization = token
    When method post
    Then status 201
      And print response


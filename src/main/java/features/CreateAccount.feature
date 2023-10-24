@Regression
Feature: Create Account Testing

#  Story 9) Activity
#  Endpoint: /api/accounts/add-primary-account
#  Send request
#  Validate response is 201
#  And validate response contain correct email entity
  Background: Setup test
    Given url "https://qa.insurance-api.tekschool-students.com"
    * def tokenResult = callonce read('GenerateToken.feature')
    * def token = "Bearer " + tokenResult.response.token

  Scenario: Create Valid account
    Given path "/api/accounts/add-primary-account"
    And request
    """
    {
      "email": "kakar88@tekschool.us",
      "firstName": "Mohammad",
      "lastName": "Shokriyan",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "SINGLE",
      "employmentStatus": "Instructor",
      "dateOfBirth": "1992-10-18"
     }
    """
    When method post
    And print response
    Then status 201
    And assert response.email == "kakar88@tekschool.us"
    * def createdAccountId = response.id
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = createdAccountId
    And header Authorization = token
    When method delete
    Then status 200
    And print response
    And match response contains {"message" :  "Account Successfully deleted" , "status" :  true}

    Scenario: Create account with existing email /api/accounts/add-primary-account validate response
      Given path "/api/accounts/add-primary-account"
      * def email = "YY@gmail.com"
      And request
      """
      {
    "email": "#(email)",
    "title": "Mr.",
    "firstName": "Laal",
    "lastName": "lakjsfl",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "SDET",
    "dateOfBirth": "1697743209152"
}
      """
      When method post
      Then print response
      Then status 201
      * def createdAccountId = response.id
      Given path "/api/accounts/add-primary-account"
      And request
      """
      {
    "email": "#(email)",
    "title": "Mr.",
    "firstName": "Laal",
    "lastName": "lakjsfl",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "SDET",
    "dateOfBirth": "1697743209152"
}
      """
      When method post
      Then print response
      Then status 400
      And assert response.errorMessage == "Account with email " + email + " is exist"
      Given path "/api/accounts/delete-account"
      And param primaryPersonId = createdAccountId
      And header Authorization = token
      When method delete
      Then status 200
      And print response
      And match response contains {"message" :  "Account Successfully deleted" , "status" :  true}
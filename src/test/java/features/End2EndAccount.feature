@Regression
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
      And assert response.email == autoEmail
      * def createdAccountId = response.id
      Given path "/api/accounts/add-account-address"
      And param primaryPersonId = createdAccountId
      And request
      """
      {
  "addressType": "8055 Windrose",
  "addressLine1": "asgfd",
  "city": "Plano",
  "state": "TX",
  "postalCode": "23452",
  "countryCode": "571",
  "current": true
}
      """
      When method post
      Then status 201
      And assert response.postalCode == 571
      Given path "/api/accounts/add-account-car"
      And param primaryPersonId = createdAccountId
      And header Authorization = token
      And request
      """
      {
  "make": "Toyota",
  "model": "Camry",
  "year": "2023",
  "licensePlate": "TX-123"
}
      """
      When method post
      Then status 201
      And assert response.make == "Toyota"
      Given path "/api/accounts/add-account-phone"
      And param primaryPersonId = createdAccountId
      And header Authorization = token
      And request
      """
      {
  "phoneNumber": "0987654321",
  "phoneExtension": "",
  "phoneTime": "Day",
  "phoneType": "Cell"
}
      """
      When method post
      Then status 201
      And assert response.phoneNumber == "0987654321"

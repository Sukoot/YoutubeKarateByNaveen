Feature: Create user using post api

  Background: 
    * url 'https://gorest.co.in'
    * def tequestPayload =
      """
      {
          "id": 0,
          "name": "Subhash",
          "email": "subhash_verma13@gmail",
          "gender": "male",
          "status": "active"
      }
      """

  Scenario: create user with giving data
    Given path '/public/v1/users'
    And request tequestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == 'Subhash'
    And match $.data.email == 'subhash_verma13@gmail'
    * print response

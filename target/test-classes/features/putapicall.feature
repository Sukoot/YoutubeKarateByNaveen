Feature: put api

  Background: 
    * url 'https://gorest.co.in'
    * def tequestPayload =
      """
      {
          "status": "inactive"
         
      }
      """

  Scenario: create user with giving data
    Given path '/public/v1/users/102'
    And request tequestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == 'Somu Deshpande'
    And match $.data.email == 'somu_deshpande@howell-vandervort.name'
    * print response

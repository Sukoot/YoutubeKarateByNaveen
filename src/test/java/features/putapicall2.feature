Feature: update more than one elements

  Background: 
    * url 'https://gorest.co.in'
    * def tequestPayload =
      """
      {
          "name": "Hamaasa",
      "email": "hamaasa124@gmail.com"
         
      }
      """

  Scenario: create user with giving data
  # what if for some reason id 107 is not availible later time? in next file check it in UPDATEUSER.FEATURE
    Given path '/public/v1/users/107'
    And request tequestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == 'Hamaasa'
    And match $.data.email == 'hamaasa124@gmail.com'
    * print response

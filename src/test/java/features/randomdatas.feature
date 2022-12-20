Feature: Create user using post api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "88e8fbe52c57985ccf546879d18dc9b7b506c92a07e4fdefb42d3885d20e3e2f";
      for(var i= 0; i<s; i ++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
        return text;
      }
      

      """
    * def randomString = random_string(10)
    * print randonString
    * def requestPayload =
      """
      {
          "id": 0,
          "name": "Subhash",
           "email": "subhash_verma11@gmail.com",
          "gender": "male",
          "status": "active"
      }

      """
    * requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: create user with giving data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == 'Subhash'
    And match $.data.email == requestPayload.email
    And print response
    

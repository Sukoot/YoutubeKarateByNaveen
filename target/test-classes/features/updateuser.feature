Feature: update user in put cal api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "ASDSDFGFHHJKLLPOIUYTREWWfgfhjkiytrGFVBHJJUIYgfftghyujjjnnjmk";
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
          
          "name": "Subhash",
          "gender": "male",
          "status": "active"
      }

      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: create user with giving data
    # create user with post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    # fetch the user id from post call response
    * def userId = $.data.id
    * print userId
    # now we can make put call to update the user
    * def requestPayload =
      """
      {
          
        
          "gender": "female",
          "status": "inactive"
      }

      """

  Scenario: create user with giving data
    Given path '/public/v1/users/108'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method put
    Then status 200
    And match $.data.id == '#present'
    #And match $.data.id == userId
    And match $.data.name == 'Subhash'
    And match $.data.email == requestPayload.email
    
    
    
    

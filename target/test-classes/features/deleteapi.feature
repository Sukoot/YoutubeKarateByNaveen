Feature: Delete user using delete api

  Background: 
    * url 'https://gorest.co.in'
    * def random_string =
      """
      function(s){
      var text = "";
      var pattern = "ASDFGHJUIYTRWEQCGVHNJKIIOIKhgvccvbnmkotrwewsxcvhJKLOLIYTREWEWQSDC";
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
          "gender": "male",
          "status": "active"
      }

      """
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: delet user with giving user id
    #1 create user using post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    # fetch the user id from the response
    * def userId = $.data.id
    * print userId
    #2delete the same user
    Given path '/public/v1/users/' + userId
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204
    # 3. get the same user id with get call
    Given url 'https://gorest.co.in/public/v1/users/' + userId
    When method get
    Then status 404
    And match $.data.message == 'Resource not found'

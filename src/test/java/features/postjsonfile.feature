Feature: pass json file in post call

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
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * set requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  #"""
  #{
  #"id": 0,
  #"name": "Subhash",
  #"email": "subhash_verma13@gmail",
  #"gender": "male",
  #"status": "active"
  #}
  #"""
  # instead of hard coding, we will read the payload from USER.JSON FILE
  
  Scenario: create user with giving data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == 'Sana'
    And match $.data.email == requestPayload.email
    * print response

# in api url we have to wright question mark and then we have wright the query para
#https://gorest.co.in/public/v2/users?id=1688    its seperate it my ?
# we can find by name , id, email, genders and so on.....
#https://gorest.co.in/public/v2/users?status=active&gender=male  we can combine too with &
Feature: Get api with query parameter

  Scenario: Get all active users
    #* def query = {status:'active'}
    # if we add gender in it will look like Also we can by id email just seperating them by cama
    * def query = {status:'active', gender: 'male'}
    Given url 'https://gorest.co.in/public/v2/users?status=active'
    And params query
    When method GET
    Then status 200
    * print response
    
     Scenario: Get all active users and get the count
 * def query = {status:'active'}
    Given url 'https://gorest.co.in/public/v2/users?status=active'
    And params query
    When method GET
    Then status 200
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
   * print userCount
   #the length is 10
   #once we get the length then we will define it if its true or not that is assurtion we use match
   * match userCount == 10
   #for path parameter, we use path for query parameter, we use params
    
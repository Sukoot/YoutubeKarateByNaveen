Feature: Get API feature

  Scenario: get api user details
    Given url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method get
    Then status 200
   * print response
   * def jsonResponse = response
   * print jsonResponse
   * def actName = jsonResponse.data.name
   * def actId = jsonResponse.data.id
   * def actEmail = jsonResponse.data.email
   * print actName
   # match means assurtion validate actualname == same name that postman give us
   * match actName == 'Lai Nehru'
   * match actId == 30
   * match actEmail == 'lai_nehru@bernhard.name'
  
  Scenario: get api user negative details
    Given url 'https://gorest.co.in/public/v1/users'
    And path '1'
    When method get
    Then status 404
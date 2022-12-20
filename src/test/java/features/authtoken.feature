  Feature: Authentication Token
  Scenario: token
   * print tokenID
   Given header Authorization = 'Bearer '+ tokenID
    Given url baseUrl+'/public/v1/users'
    And path '30'
    When method get
    Then status 200
   * print response
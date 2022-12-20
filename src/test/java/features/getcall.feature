Feature: Get Call paload

  Scenario: Calling Payload
    Given url 'https://gorest.co.in' 
    Given path '/public/v1/users'
    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    Then match $.data.id == '#present'
    And match $.data.email == "sana13@gmail.com"
    And print response

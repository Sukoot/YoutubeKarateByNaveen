Feature: Get API headers features

  Scenario: paass the user request with headres part1
    Given header Accept-Encoding = 'gzip, deflate, br'
    And header Accept = '*/*'
    And header Connection = 'keep-alive'
    And header User-Agent = 'PostmanRuntime/7.29.2'
    When url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method get
    Then status 200
    * print response

  Scenario: paass the user request with headres part2
    * def request_headers = {Accept: '*/*', Connection:'keep-alive',Connection:'keep-alive',User-Agent:'PostmanRuntime/7.29.2'}
    Given headers request_headers
    When url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method get
    Then status 200
    * print response
    
 Scenario: paass the user request with headres part3
    * configure headers = {Accept: '*/*', Connection:'keep-alive',Connection:'keep-alive',User-Agent:'PostmanRuntime/7.29.2'}
    When url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method get
    Then status 200
    * print response
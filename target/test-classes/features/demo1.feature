Feature: print hello world feature

  Scenario: Hello World Scenario
    * print 'hello world'
    * print 'hello Zahal jan'

  Scenario: declare and print variables
    * def balance = 200
    * def fee = 20
    * def tax = 10
    # it shows 2002010
    #* print 'total amount ->' + balance + fee + tax
    #it shows 230
    * print 'total amount ->' +( balance + fee + tax)

  Scenario: declare and print variables
    * def a = 200
    * def b = 20
    * print 'multi ->' +( a * b)

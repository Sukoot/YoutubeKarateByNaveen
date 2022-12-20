#how to print and how to fetch data from json objects?
#JSON:
#Key and value, for example “name”:”value”
#Data is separated by comma.
#Curly braces hold objects
#Square braces hold array
Feature: json feature testing

  Scenario: json reader parser
    # here we have 0 element and first element
    * def jsonObject =
      """
      [
      {
      "name" : "Marwa", 
      "city" : " Springfield",
      "age" : 40
      },
      {
      
      "name" : "Safa",
      "city" : " LA",
      "age" : 35
      }
      ]
      """
    # this will print entire jsonObject
    * print jsonObject
    # this print entire 0 element
    #* print jsonObject[0]
    # this print from 0 elemet only name
    * print jsonObject[0].name
    * print jsonObject[1].name + " " + jsonObject[1].city + " " + jsonObject[1].age

  Scenario: complex json reader
    # in this particular json, we have number of child json objects
    # one pop up json object
    # in menuitem we have json array again it has some key and values
    #
    * def jsonObject =
      """
      {
      "menu": {
        "id": "file",
        "value": "File",
        "popup": {
          "menuitem": [
            {"value": "New", "onclick": "CreateNewDoc()"},
            {"value": "Open", "onclick": "OpenDoc()"},
            {"value": "Close", "onclick": "CloseDoc()"}
          ]
        }
      }
      }

      """
    # how do i fetch data?
    * print jsonObject
    # will print the whole menu
    * print jsonObject.menu
    # from menu give me the id
    * print jsonObject.menu.id
    * print jsonObject.menu.popup
    * print jsonObject.menu.popup.menuitem
    * print jsonObject.menu.popup.menuitem[0].value
    * print jsonObject.menu.popup.menuitem[0].onclick

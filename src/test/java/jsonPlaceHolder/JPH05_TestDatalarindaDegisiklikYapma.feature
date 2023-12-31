
  Feature: Kullanici Json objesi olan test datalarinda degisiklik yapabilmeli


    Background:
      * def baseUrl = 'https://jsonplaceholder.typicode.com'
      * def pathParams = '/posts/70'
      * def requestBody = read ("request.json")
      * def expectedResponseBody = read ("expectedResponseBody.json")

    @api5
    Scenario: TC04 disardan Json Obje Kullanilabilmeli

      Given url  baseUrl
      And path  pathParams

      When set requestBody.title = "Hasan"
      And set expectedResponseBody.title = "Hasan"

      When request  requestBody
      And method Put
      Then status 200
      And assert response.id == expectedResponseBody.id
      And assert response.title == expectedResponseBody.title
      And assert response.body == expectedResponseBody.body
      And assert response.userId == expectedResponseBody.userId
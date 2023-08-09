Feature: JPH03 Kullanici Test datalarini Feature icinde Testten once tanimlayabilmeli

  Background: Test datalarini tanimlama

    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody =
"""
    {
    "id": 70,
    "title": "Ahmet",
    "body": "Merhaba",
    "userId": 10
    }
    """

    * def expectedResponseBody =
"""
    {
    "id": 70,
    "title": "Ahmet",
    "body": "Merhaba",
    "userId": 10
    }
    """

  Scenario:TC03 Background Kullanilabilmeli

    Given url  baseUrl
    And path  pathParams
    When request  requestBody
    And method Put
    Then status 200

    And assert responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    And assert responseHeaders['Connection'][0] == 'keep-alive'



    And assert response.id == expectedResponseBody.id
    And assert response.title == expectedResponseBody.title
    And assert response.body == expectedResponseBody.body
    And assert response.userId == expectedResponseBody.userId

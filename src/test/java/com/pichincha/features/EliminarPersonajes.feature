@REQ_TPSRE-000 @deleteCharacters
Feature: Marvel Characters Management

  Background:
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * def characterId = response[0].id

  @id:1 @deleteCharacter @casoPositivo
  Scenario: T-API-TPSRE-000-CA1-Eliminarr personaje
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/'+characterId
    And header Content-Type = 'application/json'
    When method delete
    Then status 204
    * print response


  @id:2 @deleteNotExistsCharacter @casoNegativo
  Scenario: T-API-TPSRE-000-CA1-Eliminar Personaje No Existente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/9991'
    And header Content-Type = 'application/json'
    When method delete
    Then status 404
    * print response
    * match response.error == 'Character not found'


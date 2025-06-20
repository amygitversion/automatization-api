@REQ_TPSRE-000 @updateCharacters
Feature: Marvel Characters Management

  Background:
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * def characterId = response[0].id

  @id:1 @updateCharacter @casoPositivo
  Scenario: T-API-TPSRE-000-CA1-Actualizar personaje
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/'+characterId
    And header Content-Type = 'application/json'
    And def requestBody = read('classpath:../data/requestActualizarPersonaje.json')
    And request requestBody
    When method put
    Then status 200
    * print response


  @id:2 @updateNotExistsCharacter @casoNegativo
  Scenario: T-API-TPSRE-000-CA1-Actualizar Personaje No Existente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/9991'
    And header Content-Type = 'application/json'
    And def requestBody = read('classpath:../data/requestActualizarPersonaje.json')
    And request requestBody
    When method put
    Then status 404
    * print response
    * match response.error == 'Character not found'


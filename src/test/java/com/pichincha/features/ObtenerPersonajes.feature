@REQ_TPSRE-000 @getCharacters
Feature: Marvel Characters Management

  Background:
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * def characterId = response[0].id

  @id:1 @getCharactersMarvel @casoPositivo
  Scenario: T-API-TPSRE-000-CA1-Obtener personajes de Marvel
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * print response


  @id:2 @getCharactersEmpty @casoPositivoListaVacia
  Scenario: T-API-TPSRE-000-CA1-Obtener lista vacia de personajes
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * print response
    * match response == []


  @id:3 @getCharacterById @casoPositivo
  Scenario: T-API-TPSRE-000-CA1-Obtener personaje por ID
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + characterId
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * print response


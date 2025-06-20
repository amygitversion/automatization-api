@REQ_TPSRE-000 @createCharacters
Feature: Marvel Characters Management

  Background:
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * def characterId = response[0].id

  @id:1 @createCharactersMarvel @casoPositivo
  Scenario: T-API-TPSRE-000-CA1-Crear personajes de Marvel
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    And def requestBody = read('classpath:../data/requestCrearPersonaje.json')
    And request requestBody
    When method post
    Then status 201
    * print response


  @id:2 @createExistsCharacter @casoNegativoExistePersonaje
  Scenario: T-API-TPSRE-000-CA1-Crear Personaje Existente
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    And def requestBody = read('classpath:../data/requestCrearPersonajeExistente.json')
    And request requestBody
    When method post
    Then status 400
    * print response
    * match response.error == 'Character name already exists'


  @id:3 @createCharacterMissingRequiredFields @casoNegativo
  Scenario: T-API-TPSRE-000-CA1-Crear Personaje Faltan Campos requeridos
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And header Content-Type = 'application/json'
    And def requestBody = read('classpath:../data/requestCrearPersonajeFaltaCampos.json')
    And request requestBody
    When method post
    Then status 400
    * print response
    * match response.name == 'Name is required'
    * match response.description == 'Description is required'
    * match response.alterego == 'Alterego is required'
    * match response.powers == 'Powers are required'



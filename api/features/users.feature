Feature: Gestión de Usuarios en API Reqres
  Como ingeniero de calidad
  Quiero verificar los endpoints de usuarios
  Para asegurar que la creación y recuperación de datos funciona correctamente

  Scenario: Crear un usuario y validar su persistencia y contrato
    Given que tengo los datos del usuario "Test User" con trabajo "Automation Engineer"
    When envío una solicitud POST al endpoint "/users"
    Then debo recibir un código de respuesta 201
    And la respuesta debe contener un ID de usuario válido
    
    When consulto el endpoint "/users/{id}" con el ID generado
    Then debo recibir un código de respuesta 200
    And la estructura de la respuesta debe cumplir con el contrato JSON de usuario
    And la información de usuario debe ser correcta
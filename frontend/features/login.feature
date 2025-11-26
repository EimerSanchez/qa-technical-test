Feature: Login
  Como usuario de la aplicación demo
  Quiero iniciar sesión en el sistema
  Para poder acceder al panel de gastos

  Scenario: Login exitoso con credenciales válidas
    Given que abro la página de login
    When inicio sesión con el usuario "testuser" y la contraseña "testpassword"
    Then debo ser redirigido a la página del panel de gastos

  Scenario: Fallo al intentar iniciar sesión sin ingresar usuario
    Given que abro la página de login
    When inicio sesión con un usuario vacío y la contraseña "testpassword"
    Then no debo ser redirigido al panel de gastos

  Scenario: Fallo al intentar iniciar sesión sin ingresar la contraseña
    Given que abro la página de login
    When inicio sesión con el usuario "testuser" y una contraseña vacía
    Then no debo ser redirigido al panel de gastos

  Scenario: La página de login muestra los elementos del formulario correctamente
    Given que abro la página de login
    Then debería ver el campo de usuario
    And debería ver el campo de contraseña
    And debería ver el botón de iniciar sesión

  Scenario: Los placeholders del formulario son correctos
    Given que abro la página de login
    Then el campo de usuario debería mostrar el placeholder "John Smith"
    And el campo de contraseña debería mostrar el placeholder "ABC$*1@"


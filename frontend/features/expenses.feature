Feature: Verificación de la tabla de gastos
  Como usuario autenticado
  Quiero verificar la información de la tabla de gastos
  Para asegurarme de que los datos son correctos

  Background:
    Given que he iniciado sesión exitosamente con usuario "testuser" y contraseña "testpassword"

  Scenario: Verificar número de transacciones
    Given que estoy en la página de la tabla de gastos
    When verifico el número de transacciones
    Then debe haber exactamente 6 transacciones en la tabla

  Scenario: Verificar total balance
    Given que estoy en la página de la tabla de gastos
    When verifico el total balance
    Then el total balance debe ser 350

  Scenario: Verificar Credit Available
    Given que estoy en la página de la tabla de gastos
    When verifico el Credit Available
    Then el Credit Available debe ser 17800

  Scenario: Verificar colores de valores positivos
    Given que estoy en la página de la tabla de gastos
    When verifico los colores de los valores
    Then los valores positivos deben estar en verde

  Scenario: Verificar colores de valores negativos
    Given que estoy en la página de la tabla de gastos
    When verifico los colores de los valores
    Then los valores negativos deben estar en rojo

  Scenario: Verificar todas las validaciones requeridas
    Given que estoy en la página de la tabla de gastos
    When verifico todas las validaciones
    Then debe haber exactamente 6 transacciones en la tabla
    And el total balance debe ser 350
    And el Credit Available debe ser 17800
    And los valores positivos deben estar en verde
    And los valores negativos deben estar en rojo

  # Casos de prueba extra
  Scenario: Verificar estructura de la tabla
    Given que estoy en la página de la tabla de gastos
    Then la tabla debe estar visible
    And la tabla debe tener los headers correctos

  Scenario: Verificar que todas las transacciones tienen datos completos
    Given que estoy en la página de la tabla de gastos
    When obtengo todas las transacciones
    Then cada transacción debe tener Status, Date, Description, Category y Amount

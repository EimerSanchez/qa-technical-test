require_relative '../../pages/expenses_page'

# === Configuración Inicial ===

Given('que estoy en la página de la tabla de gastos') do
  @expenses_page = ExpensesPage.new(@driver)
  expect(@expenses_page.is_expenses_page?).to be true
end

# === Validación de Conteo de Transacciones ===

When('verifico el número de transacciones') do
  @transactions_count = @expenses_page.get_transactions_count
end

Then('debe haber exactamente {int} transacciones en la tabla') do |expected_count|
  count = @expenses_page.get_transactions_count
  expect(count).to eq(expected_count)
end

# === Validación de Total Balance ===

When('verifico el total balance') do
  @total_balance = @expenses_page.get_total_balance
end

Then('el total balance debe ser {int}') do |expected_balance|
  balance = @expenses_page.get_total_balance
  expect(balance).to eq(expected_balance)
end

# === Validación de Credit Available ===

When('verifico el Credit Available') do
  @credit_available = @expenses_page.get_credit_available
end

Then('el Credit Available debe ser {int}') do |expected_credit|
  credit = @expenses_page.get_credit_available
  expect(credit).to eq(expected_credit)
end

# === Validación de Colores de Valores ===

When('verifico los colores de los valores') do
  # Step sin acción - la validación se realiza en los steps Then
end

Then('los valores positivos deben estar en verde') do
  expect(@expenses_page.are_positive_values_green?).to be true
end

Then('los valores negativos deben estar en rojo') do
  expect(@expenses_page.are_negative_values_red?).to be true
end

When('verifico todas las validaciones') do
  # Step agregador - permite agrupar múltiples validaciones en escenarios
end

# === Validaciones de Estructura de Tabla ===

Then('la tabla debe estar visible') do
  expect(@expenses_page.is_table_visible?).to be true
end

Then('la tabla debe tener los headers correctos') do
  expect(@expenses_page.verify_table_headers).to be true
end

# === Validación de Datos de Transacciones ===

When('obtengo todas las transacciones') do
  @transactions = @expenses_page.get_all_transactions
end

Then('cada transacción debe tener Status, Date, Description, Category y Amount') do
  @transactions.each do |transaction|
    # Verificar presencia de todos los campos requeridos
    expect(transaction).to have_key(:status)
    expect(transaction).to have_key(:date)
    expect(transaction).to have_key(:description)
    expect(transaction).to have_key(:category)
    expect(transaction).to have_key(:amount)
    
    # Verificar que los campos contengan datos
    expect(transaction[:status]).not_to be_empty
    expect(transaction[:date]).not_to be_empty
    expect(transaction[:description]).not_to be_empty
    expect(transaction[:category]).not_to be_empty
    expect(transaction[:amount]).not_to be_empty
  end
end
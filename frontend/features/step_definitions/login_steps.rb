require_relative '../../pages/login_page'
require_relative '../../pages/expenses_page'

# Steps Definitions para Login

Given('que abro la página de login') do
  @login_page = LoginPage.new(@driver)
  @login_page.navigate
  expect(@login_page.is_login_page?).to be true
end

# Acciones

When('inicio sesión con el usuario {string} y la contraseña {string}') do |username, password|
  @login_page.login(username, password)
end

When('inicio sesión con un usuario vacío y la contraseña {string}') do |password|
  @login_page.login('', password)
end

When('inicio sesión con el usuario {string} y una contraseña vacía') do |username|
  @login_page.login(username, '')
end

# Resultados / Expectativas

Then('debo ser redirigido a la página del panel de gastos') do
  @expenses_page = ExpensesPage.new(@driver)
  expect(@expenses_page.verify_redirect_after_login).to be true
end

Then('no debo ser redirigido al panel de gastos') do
  expect(@login_page.is_login_page?).to be true
  expect(@driver.current_url).not_to include('hackathonAppV2.html')
end

# Validaciones UI

Then('debería ver el campo de usuario') do
  expect(@login_page.username_visible?).to be true
end

Then('debería ver el campo de contraseña') do
  expect(@login_page.password_visible?).to be true
end

Then('debería ver el botón de iniciar sesión') do
  expect(@login_page.login_button_visible?).to be true
end

# Validaciones de Placeholders

Then('el campo de usuario debería mostrar el placeholder {string}') do |expected|
  expect(@login_page.placeholder_username).to eq(expected)
end

Then('el campo de contraseña debería mostrar el placeholder {string}') do |expected|
  expect(@login_page.placeholder_password).to eq(expected)
end

# Step compartido para escenarios que requieren login previo

Given('que he iniciado sesión exitosamente con usuario {string} y contraseña {string}') do |username, password|
  @login_page = LoginPage.new(@driver)
  @login_page.login(username, password)

  @expenses_page = ExpensesPage.new(@driver)
  expect(@expenses_page.verify_redirect_after_login).to be true
end

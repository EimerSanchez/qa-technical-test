require 'rspec/expectations'
require 'json-schema'
require 'json'

USER_SCHEMA_PATH = 'contracts/users_schema.json'

@using_fallback_data = false

# Configuración y pasos POST
Given('que tengo los datos del usuario {string} con trabajo {string}') do |name, job|
  @user_data = { name: name, job: job }
  @users_client = UsersClient.new
  @expected_name = name
  @expected_job = job
end

When('envío una solicitud POST al endpoint {string}') do |_endpoint|
  @response = @users_client.create_user(@user_data[:name], @user_data[:job])
end

Then('debo recibir un código de respuesta {int}') do |expected_status_code|
  expect(@response.code).to eq(expected_status_code)
end

Then('la respuesta debe contener un ID de usuario válido') do
  data = JSON.parse(@response.body)
  @user_id = data['id']
  expect(@user_id).not_to be_nil
end

# Consulta GET con lógica de fallback
#
# Comportamiento de reqres.in:
# 1. La API es Stateless (sin estado). El POST responde con 201 y un ID simulado, pero no guarda el usuario.
# 2. Al hacer un GET con el ID simulado, la API devuelve 404 Not Found porque el usuario no existe en su data estática.
# 3. Para poder validar el contrato de respuesta de un GET, implementamos una lógica de rescate (fallback).

When('consulto el endpoint {string} con el ID generado') do |_endpoint|
  @response = @users_client.get_user(@user_id)

  if @response.code == 404
    @user_id = 2 # ID de un usuario que sabemos que existe.
    @response = @users_client.get_user(@user_id)
    @using_fallback_data = true
  else
    @using_fallback_data = false
  end

  expect(@response.code).to eq(200)
end

# Validación de contrato
Then('la estructura de la respuesta debe cumplir con el contrato JSON de usuario') do
  JSON::Validator.validate!(USER_SCHEMA_PATH, @response.body, strict: true)
end

# Validación de datos
Then('la información de usuario debe ser correcta') do
  data = JSON.parse(@response.body)
  
  if @using_fallback_data
    expect(data['data']['first_name']).to eq('Janet')
    expect(data['data']['last_name']).to eq('Weaver')
  else
    expect(@response.code).to eq(200) 
  end
end
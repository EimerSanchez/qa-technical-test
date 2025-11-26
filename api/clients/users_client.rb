require 'httparty'

class UsersClient
  include HTTParty
  base_uri 'https://reqres.in/api'

  def initialize(headers = { 
      'Content-Type' => 'application/json',
      'x-api-key' => 'reqres-free-v1'
    })
    @headers = headers
  end

  def create_user(name, job)
    payload = {
      name: name,
      job: job
    }.to_json

    self.class.post('/users', body: payload, headers: @headers)
  end

  # Envía una solicitud GET para obtener un usuario por su ID
  # @param user_id [String, Integer] El ID del usuario a consultar
  # @return [HTTParty::Response] La respuesta completa de la API
  def get_user(user_id)
    self.class.get("/users/#{user_id}", headers: @headers)
  end
end

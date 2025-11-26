require 'httparty'
require 'rspec/expectations'
require 'cucumber'

# Cargar todos los clientes de API automáticamente
Dir[File.join(File.dirname(__FILE__), '../../clients/*.rb')].each { |file| require file }

# Cargar el archivo de steps
require_relative '../step_definitions/users_steps.rb'

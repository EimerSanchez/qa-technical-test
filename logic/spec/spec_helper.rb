require 'rspec'

# Cargar todos los archivos de la carpeta lib automáticamente
Dir[File.join(File.dirname(__FILE__), '../lib/*.rb')].each { |file| require file }

RSpec.configure do |config|
end

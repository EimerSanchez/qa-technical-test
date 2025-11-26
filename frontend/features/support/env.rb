require 'selenium-webdriver'
require 'rspec/expectations'

# Cargar Page Objects
Dir[File.dirname(__FILE__) + '/../../pages/*.rb'].each { |file| require file }

# Configuración de Selenium WebDriver
Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')
  options.add_argument('--disable-notifications')
  options.add_argument('--disable-infobars')
  
  @driver = Selenium::WebDriver.for :chrome, options: options
  @driver.manage.timeouts.implicit_wait = 10
  @driver.manage.timeouts.page_load = 30
end

After do
  @driver.quit if @driver
  @driver = nil
end

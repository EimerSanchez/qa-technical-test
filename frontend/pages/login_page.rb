require_relative 'base_page'

class LoginPage < BasePage
  def initialize(driver)
    super(driver)
    @url = 'https://demo.applitools.com/hackathonV2.html'
    
    @username_input = { id: 'username' }
    @password_input = { id: 'password' }
    @login_button = { id: 'log-in' }
    @error_message = { xpath: "//*[contains(@class, 'error') or contains(@class, 'alert')]" }
  end

  def navigate
    visit(@url)
    self
  end

  def enter_username(username)
    type(@username_input, username)
    self
  end

  def enter_password(password)
    type(@password_input, password)
    self
  end

  def click_login
    click(@login_button)
    self
  end

  # Ejecuta el flujo completo de inicio de sesión
  def login(username, password)
    navigate
    enter_username(username)
    enter_password(password)
    click_login
  end

  def is_login_page?
    @driver.current_url.include?('hackathonV2.html')
  end

  def username_visible?
    wait_for_page_load
    displayed?(@username_input)
  end

  def password_visible?
    wait_for_page_load
    displayed?(@password_input)
  end

  def login_button_visible?
    wait_for_page_load
    displayed?(@login_button)
  end

  def placeholder_username
    wait_for_page_load
    get_attribute(@username_input, 'placeholder')
  end

  def placeholder_password
    wait_for_page_load
    get_attribute(@password_input, 'placeholder')
  end

  def error_message_present?
    displayed?(@error_message)
  end
end
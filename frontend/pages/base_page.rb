class BasePage
  def initialize(driver)
    @driver = driver
  end

  def visit(url)
    @driver.navigate.to(url)
  end

  def find(locator)
    @driver.find_element(locator)
  end

  def type(locator, text)
    element = wait_for_element(locator)
    element.clear
    element.send_keys(text)
  end

  def click(locator)
    wait_for_element(locator).click
  end

  def displayed?(locator)
    begin
      wait_for_element(locator).displayed?
    rescue Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def get_attribute(locator, attribute)
    begin
      wait_for_element(locator).attribute(attribute)
    rescue Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::NoSuchElementError
      nil
    end
  end

  def wait_for_page_load(timeout = 30)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.execute_script('return document.readyState') == 'complete' }
  end

  private

  def wait_for_element(locator, timeout = 10)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_element(locator) }
  end
end

require 'selenium-webdriver'
require 'yaml'

class Driver
  attr_accessor :driver

  @driver = nil
  $focus_driver = nil

  def initialize(browser = Config.browser)
    begin
      start(browser)
      Log.info("#{browser} browser started...")
    rescue StandardError => e
      Log.info("Driver failed to initialize #{browser} browser..")
      start(browser)
      Log.info("Driver initialized agan after exception..")
    end
  end

  def start(browser)
    case browser
    when 'chrome'
      Selenium::WebDriver::Chrome::Service.driver_path = "/Users/admin/Documents/Zadatak_UpWork/taskUW/config/chromedriver"
      @driver = Selenium::WebDriver.for(:chrome)
      @driver.manage.timeouts.implicit_wait = Config.implicit_wait
    when 'firefox'
      @driver = Selenium::WebDriver.for(:firefox)
      @driver.manage.timeouts.implicit_wait = Config.implicit_wait
    else
      raise ArgumentError, "Specify a proper browser while initiating a driver "
    end
    @driver.manage.window.maximize
    $focus_driver = self
    return self
  end

  def get(url)
    @driver.get(url)
    Log.info("Browser is loaded with ulr #{url}")
  end

  def clear_cookies
    @driver.manage.delete_all_cookies
    Log.info("From #{Config.browser} browser, all cokies deleted")
  end

  def quit
    Log.info("Closing browser..")
    @driver.quit
  end

  def find_element(locator)
    $focus_driver = self
    Wait.wait_for_element(locator)
    return @driver.find_element(locator.how, locator.what)
  end
  def find_elements(locator)
    $focus_driver = self
    return @driver.find_elements(locator.how,locator.what)
  end

end


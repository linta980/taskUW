require 'selenium-webdriver'
require 'yaml'

module Libraries
  class Driver
    attr_accessor :driver
    @driver=nil
    $focus_driver=nil
    def initialize(driver_name="Driver", browser =Config.browser)
      begin
        start(browser)
        Log.info("#{browser} browser started...")
      rescue Exception =>e
        Log.info("Driver failed to initialize #{browser} browser..")
        start(browser)
        Log.info("Driver initialized agan after exception..")
      end
    end

    def start(browser)
      case browser
      when 'chrome'
        Selenium::WebDriver::Chrome.driver_path="C:/ChromeDriver/chromedriver.exe"
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(:chrome_options =>{detach:true})
        @driver =Selenium::WebDriver.for(:chrome ,desired_capabilities:caps)
        @driver.manage.timeouts.implicit_wait = Config.implicit_wait
      when 'firefox'
        @driver = Selenium::WebDriver.for(:firefox )
        @driver.manage.timeouts.implicit_wait = Config.implicit_wait
      else
        raise ArgumentError, "Specify a proper browser while initiating a driver "
      end
      @driver.manage.window.maximize
      $focus_driver=self
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

    end









  end


end

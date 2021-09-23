include Libraries

module Libraries
  class Locator
    attr_accessor :how
    attr_accessor :what
    attr_accessor :options

    # On initializing we need to give the locator finder key as well as the locator path
    # Ex: Locator.new(:css, "div.header")
    def initialize(how, what)
      @how = how
      @what = what
    end

    def self.is_present?(driver = $focus_driver)
      driver.manage.timeouts.implicit_wait =0
      begin
        return driver.find_element(self.how, self.what).displayed?
      rescue Exception => e
        driver.manage.timeouts.implicit_wait = Config.implicit_wait
        return false
      ensure
        driver.manage.timeouts.implicit_wait=Config.implicit_wait
      end
    end

    def self.click(driver=$focus_driver)
      begin
        driver.find_element(self).click
        Log.info("Element clicked #{self.how} => #{self.what}")
      rescue
        Log.info("Element not clicked #{self.how} => #{self.what}")
        Log.info(e.message)
      end
    end

    def self.is_element_present_with_wait?(driver=$focus_driver, timeout=Config.implicit_wait)
      Wait.wait_for_element(self ,timeout, driver)
      is_present?(driver)
    end
  end
end

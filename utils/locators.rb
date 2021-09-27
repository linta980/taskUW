# include Libraries

require_relative '../utils/wait'
require_relative '../utils/config'
require_relative '../utils/logger'

class Locator
  attr_accessor :how, :what, :options

  # in constructor, we define how would sintact look like for each element on page
  # we have :how for types (css, xpath, id ect.)
  # and :what string
  def initialize(how, what)
    @how = how
    @what = what
  end

  # method for waiting element to show up on page, retruns false if elemnt not present
  def is_present?(driver = $focus_driver)
    driver.driver.manage.timeouts.implicit_wait = 5
    begin
      return driver.driver.find_element(self.how, self.what).displayed?
    rescue StandardError => e
      driver.driver.manage.timeouts.implicit_wait = Config.implicit_wait
      return false
    ensure
      driver.driver.manage.timeouts.implicit_wait = Config.implicit_wait
    end
  end

  #method for clicking on element on page
  def click(driver = $focus_driver)
    begin
      driver.find_element(self).click
      Log.info("Element clicked #{self.how} => #{self.what}")
    rescue StandardError => e
      Log.fail("Element not clicked #{self.how} => #{self.what}" + e.message)
    end
  end

  #method for waiting for element for some time
  def is_element_present_with_wait?(timeout = Config.implicit_wait, driver = $focus_driver)
    Wait.wait_for_element(self, timeout)
    is_present?(driver)
  end

  # method for setting text into input field
  def send_keys(*args)
    begin
      $focus_driver.find_element(self).send_keys(*args)
    rescue StandardError => e
      Log.fail("You cannot set text to element #{self.how } => #{self.what}" + e.message)
    end
  end

  # method for clearing and sending text to input field
  def clear_and_send_keys(*args)
    clear($focus_driver)
    send_keys(*args)
  end

  # method for only clearing text in input field
  def clear(driver = $focus_driver)
    driver.find_element(self).clear
  end

  # method for grabbing text from input field
  def text(driver = $focus_driver)
    return driver.find_element(self).text
  end

  #method for taking text from multiple web elements
  def texts(driver = $focus_driver)
    elements_text = []
    driver.find_elements(self).each do |element|
      elements_text.push(element.text)
    end
    return elements_text
  end
end

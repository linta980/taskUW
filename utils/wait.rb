include Libraries

module Libraries
  module Wait
    def wait_for_element(locator, timeout=Config.timeout, focus_driver = $focus_driver)
      index =0
      while locator.is_present? == false
        sleep 1
        if index == timeout
          break
        end
        index+=1
      end
    end
  end
end

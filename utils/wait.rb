include Libraries
require_relative '../utils/locators'

module Libraries
  module Wait
    class << self
      def wait_for_element(locator, timeout = Config.implicit_wait)
        index = 0
        while locator.is_present? == false
          sleep 1
          if index == timeout
            break
          end
          index += 1
        end
      end
    end

  end
end

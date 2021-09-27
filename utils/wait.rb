
require_relative '../utils/locators'

module Libraries
  module Wait
    class << self #<<self means that we do not need to instantiate Wait class in order to reach wait_for_elements method
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

require_relative '../locators/home.rb'


module Pages
  #inheriting Home class from ..hmm
  class Home < Locators::Home

    def initialize
      super()
    end
    #method for selecting proffesional
    def search_for_proffesional()
      @search_dropdown.is_element_present_with_wait?()
      @search_dropdown.click()
    end
  end

end

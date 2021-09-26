require_relative '../locators/home.rb'


module Pages

  class Home < Locators::Home

    def initialize
      super()
    end

    def search_for_proffesional()
      puts "evo ga krece 1 ..."
      @search_dropdown.is_element_present_with_wait?()
      @search_dropdown.click()
      # @search_dropdown.send_keys("Angular")
      # @angular_proffesionals.is_element_present_with_wait?
      # @angular_proffesionals.click
    end
  end

end

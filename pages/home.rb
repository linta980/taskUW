include Libraries

module Pages
  class Home

    attr_reader :search_dropdown
    attr_reader :angular_professionals
    attr_reader :qa_automation
    attr_reader :project_managers
    def initialize
      @search_dropdown = Locator.new(:xpath, "(.//input[@type='search'])")
      @angular_proffesionals = Locator.new(:xpath, "(.//span[contains(text(),'Angular')])")
      @qa_automation = Locator.new(:xpath, "(.//span[contains(text(),'QA Automation')])")
      @project_managers =Locator.new(:xpath,"(.//span[contains(text(),'Project Manager')])" )
    end

    def search_for_proffesional(professional)
      @search_dropdown.is_element_present_with_wait?
      @search_dropdown.click
      @angular_proffesionals.is_element_present_with_wait?
      @angular_proffesionals.click


    end
  end

end

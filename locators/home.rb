include Libraries
require_relative '../utils/locators'

class Home
  attr_accessor :search_dropdown, :angular_proffesionals, :qa_automation, :project_managers

  def initialize
    # (.//a[text()='Sign Up'])
    @search_dropdown = Locator.new(:xpath, "(.//input[@data-cy='search-input'])")
    @angular_proffesionals = Locator.new(:xpath, "(.//span[contains(text(),'Angular')])")
    # @search_dropdown = Locator.new(:xpath, "(.//span[text()='Enterprise'])")
    # @qa_automation = Locator.new(:xpath, "(.//span[contains(text(),'QA Automation')])")
    # @project_managers =Locator.new(:xpath,"(.//span[contains(text(),'Project Manager')])" )
  end

  def search_for_proffesional(search_term)
    @search_dropdown.is_element_present_with_wait?
    @search_dropdown.send_keys(search_term)
    @angular_proffesionals.click
    # @search_dropdown.send_keys("Angular")
    # @angular_proffesionals.is_element_present_with_wait?
    # @angular_proffesionals.click
  end
end


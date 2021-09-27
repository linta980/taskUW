
require_relative '../utils/locators'

class Home
  attr_accessor :search_dropdown, :angular_proffesionals, :qa_automation, :project_managers

  #constructor for initializing search field and item from dropdown
  def initialize
    @search_dropdown = Locator.new(:xpath, "(.//input[@data-cy='search-input'])")
    @angular_proffesionals = Locator.new(:xpath, "(.//span[contains(text(),'Angular')])")
  end
  #method for searching the proffesionals
  def search_for_proffesional(search_term)
    @search_dropdown.is_element_present_with_wait?
    @search_dropdown.send_keys(search_term)
    @angular_proffesionals.click
  end
end


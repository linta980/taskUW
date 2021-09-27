require_relative '../utils/locators'

class ProfilePreview

  attr_reader :name, :country

  def initialize
    @name = Locator.new(:xpath, "(.//section[@class='up-card-section py-30']//h1[@itemprop='name'])")
    @country = Locator.new(:xpath, "(.//section[@class='up-card-section py-30']//span[@itemprop='locality'])")
  end

end



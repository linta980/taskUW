# Locator class to declare the locators in the Upwork Search listing page
require_relative "../utils/locators"
include Libraries

class SearchListing

  attr_reader :search_list_cards, :search_list_profile_stats, :back_button

  def initialize

    # @search_listing_header = Locator.new(:css, "h1.top-freelancers")
    @search_list_cards = Locator.new(:css, "div.up-card-section")
    @search_list_profile_stats = Locator.new(:css, "div.up-card-section div.profile-stats")
    @back_button = Locator.new(:css, " div.up-slider-header div button")

  end

  def search_list_name(i)
    # @search_list_name = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'identity-name')]")
    @search_list_name = Locator.new(:xpath, "(.//div[contains(@class,'identity-name')])[#{i}]")

  end

  def search_list_title(i)
    # @search_list_title = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//p[contains(@class,'freelancer-title')]")
    @search_list_title = Locator.new(:xpath, "(.//p[contains(@class,'freelancer-title')])[#{i}]")

  end

  def search_list_country(i)
    # @search_list_country = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'profile-stats')]//span[@itemprop='country-name']")
    @search_list_country = Locator.new(:xpath, "(.//span[@itemprop='country-name'])[#{i}]")

  end

  def search_list_price(i)
    # @search_list_cost = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'profile-stats')]//p[@class='mb-5']")
    @search_list_cost = Locator.new(:xpath, "(.//div[@data-qa='rate'])[#{i}]")
  end
  def search_list_upskill_badge(i)
    @search_list_upskill_badge = Locator.new(:xpath, "(.//div[@class='up-skill-badge'])[#{i}]")
  end
  
  
  
  
  
  # def search_list_success_rate(itr)
  #   @search_list_success_rate = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'profile-stats')]//div[@class='d-flex']")
  # end
  #
  #
  #
  # def search_list_earned(itr)
  #   @search_list_earned = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'profile-stats')]//div[@class='mb-5']")
  # end
  #
  # def search_list_overview(itr)
  #   @search_list_overview = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//p[contains(@class,'overview')]")
  # end
  #

  #
  # def search_list_asssociated_with(itr)
  #   @search_list_asssociated_with = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'freelancer-tile-agency-box-legacy')]//div[contains(@class,'agency-box-logo-name')]")
  # end
  #
  # def search_list_asssociated_with_stats(itr)
  #   @search_list_asssociated_with_stats = Locator.new(:xpath, "//div[contains(@class,'up-card-section')][#{itr}]//div[contains(@class,'freelancer-tile-agency-box-legacy')]//div[contains(@class,'agency-box-stats')]")
  # end

end


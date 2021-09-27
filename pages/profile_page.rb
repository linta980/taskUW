# frozen_string_literal: true
require_relative '../locators/profile_page'

class ProfilePage < ProfilePreview

  # To make all the locators available within this class
  def initialize
    super()
  end

  # method for returning hashed result from preview page
  def create_hash_for_preview_page
    name = @name.is_present? ? @name.text : nil
    country = @country.is_present? ? @country.text : nil

    result_hash = {
      "name": name,
      "country": country
    }
    return result_hash
  end

end
  
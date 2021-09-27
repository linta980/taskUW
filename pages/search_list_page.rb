require_relative "../locators/search_list_page"

# Page class inherits the locator class
class SearchList < SearchListing

  def initialize
    super()
  end

  # method to return parsed data from search
  def parse_results_page_and_store_values
    final = {}
    (1..10).each do |i|
      name = search_list_name(i).is_present? ? search_list_name(i).text : nil
      title = search_list_title(i).is_present? ? search_list_title(i).text : nil
      country = search_list_country(i).is_present? ? search_list_country(i).text : nil
      price = search_list_price(i).is_present? ? search_list_price(i).text : nil
      upskill_tags = search_list_upskill_badge(i).is_present? ? search_list_upskill_badge(i).texts : nil

      result_hash = {
        "name": name,
        "title": title,
        "country": country,
        "price": price,
        "upskill_tags": upskill_tags,
      }
      final[i] = result_hash
    end
    return final
  end

  # method to select random profile
  def select_freelancer(item)
    select_random_profile(item).click
  end

  # method to return back from profile view
  def check_back_button_present
    if back_button.is_present?
      true
    end
  end

end


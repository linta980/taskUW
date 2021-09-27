
require_relative 'spec_helper'
require_relative '../locators/home'
require_relative '../pages/search_list_page'


describe('Find Angulars workers in UpWork') do
  before_all do
    puts 'Before All...'
  end

  after_all do
    puts 'After All...'
    @driver.quit
  end

  it('Find Angular professionals using search') do
    step("Run browser") do
      @driver = Driver.new
      @driver.get(Config.url)
      # sleep 10

    end
    step("Clear all cookies") do
      @driver.clear_cookies
    end
    step("Select Angular professional in search dropdown") do
      @home_page = Home.new
      @home_page.search_for_proffesional("Angular")
    end
    step("Parsing first page from search term") do
      @search_list = SearchList.new
      @result_hash = @search_list.parse_results_page_and_store_values
      Log.info("Data parsed from page => #{@result_hash}")
    end
    step("Validate search result with search keyword") do
      pass_search = []
      @result_hash.each do |key, value|
        fail = {}
        value.each do |k, v|
          if k.to_s == "title"
            if v.to_s.include? "Angular"
              pass_search.push({ "title": v })
            end
          end
        end
      end
      if pass_search.count() == 0
        Log.fail("No matching criteria found in search results")
      else
        Log.pass("Search criteria FOUND in search results on #{pass_search.count()} places")
      end
    end
    step ("Open random Angular professional profile") do
      @random_profile = rand(1..10)
      @search_list.select_freelancer(@random_profile)
      assert_equal(@search_list.check_back_button_present.to_s, true.to_s)
      sleep 5
    end
    # not working at the moment .. we need to discuss
    step ("Verify opened freelance profile") do
      profile_preview = ProfilePage.new
      @profile_hash = profile_preview.create_hash_for_preview_page
      Log.info("Profile priview details => #{@profile_hash}")
    end

  end

end

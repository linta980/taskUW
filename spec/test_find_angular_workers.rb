require_relative 'spec_helper.rb'
require_relative '../pages/home.rb'
require_relative '../utils/assert'

require 'yaml'
include Pages
describe('Find Angulars workers in UpWork') do
  before_all do
    puts 'Before All...'
    @driver = Driver.new
  end

  after_all do
    puts 'After All...'
    @driver.quit
  end

  it('Find Angular professionals using search') do
    step("Clear all cookies") do
      @driver.clear_cookies
    end
    step("Navigate to UpWork site") do
      @driver.get(Config.url)
      puts assert_equal(3,3)
      sleep(3)
    end

  end
end

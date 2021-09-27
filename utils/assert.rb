# frozen_string_literal: true
include Libraries

# method for checking weather two stings are equal
def assert_equal(val1, val2, message = nil)
  if val1 == val2
    Log.pass(message || "#{val1} is equal to #{val2}")
  else
    Log.fail(message || "#{val1} is not equal to #{val2}")
  end

end
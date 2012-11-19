$LOAD_PATH << File.expand_path('../test', ENV['BUNDLE_GEMFILE'])

require 'test_credentials'
TestCredentials.get_credentials

# acts_as Test::Unit -KB
require 'minitest/autorun'
Test = MiniTest

class Test::Unit::TestCase
  def self.test_order
    # Tests are order-dependent by design, apparently
    :alpha
  end

  # Flunk the test with the provided message if the block raises -KB
  # MiniTest fixed this but Test::Unit is still awful and the tests use this
  # (they mean 'raise' when they say throw)
  def assert_nothing_thrown(msg = 'assert_nothing_thrown with no message', &block)
    begin
      block.call
    rescue StandardError => e
      flunk(exception_details(e, msg))
    end
  end

  # Use awesome_print
  def mu_pp(object)
    ap(object)
  end
end

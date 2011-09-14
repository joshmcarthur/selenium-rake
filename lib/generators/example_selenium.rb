require "test/unit"
require "rubygems"
require "selenium/client"
#require "lib/selenium_config"

class Example < Test::Unit::TestCase

# include SeleniumConfig

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://www.google.co.nz/",
      :timeout_in_second => 60
    @selenium.start_new_browser_session
    @selenium.set_speed("1000")
    # rails generate config
    # Then you can uncomment the line below, require the config above and delete the 7 lines above to use global selenium config found in lib folder
    # global_config
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_eg
    @selenium.open "/"
    @selenium.click "id=lst-ib"
    @selenium.type "id=lst-ib", "selenium"
    begin
        assert @selenium.is_text_present("Selenium - Web Browser Automation")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
  end
end

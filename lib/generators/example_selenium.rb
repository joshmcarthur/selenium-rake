require "test/unit"
require "rubygems"
require "selenium/client"
# require "#{File.dirname(__FILE__)}/selenium_config"
#require "selenium_config"

class Example < Test::Unit::TestCase

# include SeleniumConfig

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://www.google.com",
      :timeout_in_second => 60
    @selenium.start_new_browser_session
    @selenium.set_speed('1000')
    # Uncomment the line below and delete the 7 lines above to use global selenium config
    # global_config
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_eg
    @selenium.open "/"
    @selenium.type "id=lst-ib", "selenium"
    @selenium.click "name=btnG"
    @selenium.click "link=Selenium - Web Browser Automation"
    @selenium.wait_for_page_to_load "30000"
    assert_equal "Selenium - Web Browser Automation", @selenium.get_title
    @selenium.click "link=Documentation"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=Selenium 1 (Selenium RC)"
    @selenium.wait_for_page_to_load "30000"
  end
  
end

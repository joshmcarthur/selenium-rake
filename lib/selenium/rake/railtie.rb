require 'rails'
module Selenium
  module Rake
    class Railtie < Rails::Railtie
    railtie_name :selenium_rake

    rake_tasks do
      load "#{File.dirname(__FILE__)}/tasks/selenium.rake"
    end
  end
  end
end
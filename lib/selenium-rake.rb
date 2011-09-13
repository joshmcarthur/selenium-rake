require "selenium/rake/version"

module Selenium
  module Rake
		require 'selenium/rake/railtie' if defined?(Rails)
  end
end

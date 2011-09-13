class ConfigGenerator < Rails::Generators::Base
	source_root File.expand_path('../',__FILE__)
	
	def generate_config
		copy_file "selenium_config.rb", "lib/selenium_config.rb"
	end
	
end



class ExampleGenerator < Rails::Generators::Base
	source_root File.expand_path('../',__FILE__)
	
	def generate_example
		copy_file "example_selenium.rb", "test/functional/example_selenium.rb"
	end
	
end

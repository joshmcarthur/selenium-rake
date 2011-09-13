#require "bundler/gem_tasks"
require "selenium/client"
 
selenium_jar_file_path  = "#{File.dirname(__FILE__)}/selenium-2.5.0.jar"
 
 	# This rake task starts the selenium server
	desc "Start the selenium-rc server"
		Selenium::Rake::RemoteControlStartTask.new("rc") do |rc|
			rc.port = 4444
			rc.timeout_in_seconds = 2 * 60
			rc.background = true
			rc.wait_until_up_and_running = true
			rc.jar_file = selenium_jar_file_path
		end
	
	# This rake task stops the selenium server
	desc "Stop the selenium-rc server" 
		Selenium::Rake::RemoteControlStopTask.new("rc:stop") do |rc|
			rc.host = "localhost"
			rc.port = 4444
			rc.timeout_in_seconds = 3 * 60
		end
	
	# This just calls the run_scripts method below
	desc "Run all selenium tests"
		task :"rc:tests" do
		Dir['test/functional/*_selenium.*'].each do |script|
		# This line allows you to ingnore test files if required
		next if script.include? 'setup.rb'
			print "Running #{script}"
			puts %x[ruby #{script}]
		end			
		end 

	# This method loads all scripts in the directory
#	def run_scripts
	#	Dir['lib/selenium/tests/*.rb'].each do |script|
		# This line allows you to ingnore test files if required
		#next if script.include? 'setup.rb'
			#print "Running #{script}"
			#puts %x[ruby #{script}]
	#	end
	#end

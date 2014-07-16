gem 'minitest', '~> 5.3'
require 'minitest/autorun'
require 'minitest/pride'

def instructions(source_file, test_file=default_test_file(source_file))
  puts "\n======================================================="
  puts "          ** YOUR TASK ** \n"
  puts "  Write code to make the tests pass."
  puts
  puts "  The process is:"
  puts "    1) add code to \n        #{source_file} \n      to make the currently failing test pass"
  puts
  puts "    2) remove next skip from \n        #{test_file}"
  puts "    3) modify your code to pass both tests"
  puts
  puts "    4) remove next skip from the test"
  puts "    5) modify your code to pass all three tests"
  puts
  puts "    Continue until all tests pass and none are skipped."
  puts "===========================================================\n"
end

def default_test_file(source_file)
  source_file.gsub(/\./, '_test.').gsub(/lib/, 'test')
end

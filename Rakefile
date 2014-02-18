
task :default => [:test]

# see http://rake.rubyforge.org/classes/Rake/TestTask.html
require 'rake/testtask'

task :test => [:test_unit, :test_framework] do
end

Rake::TestTask.new(:test_unit) do |t|
  puts 'Running Unit Tests'
  t.pattern = 'test/unit/**/*_test.rb'
end

Rake::TestTask.new(:test_framework) do |t|
  puts 'Running Framework Tests'
  t.pattern = 'test/framework/**/*_test.rb'
end

task :docs do
  puts 'removing docs directory'
  FileUtils.rm_rf('doc')
  puts 'removing .yardoc directory'
  FileUtils.rm_rf('.yardoc')
  puts 'generating yard docs in docs directory'
  `yardoc`
end

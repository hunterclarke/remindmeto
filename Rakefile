require "rspec/core/rake_task"
require "bundler/gem_tasks"
require "remindmeto/version"

task :default => :test

RSpec::Core::RakeTask.new(:spec)
desc 'Run RSpec tests'
task :test => [:spec]

task :build do
  `gem build remindmeto.gemspec`
end

task :install do
  `gem install remindmeto-#{RemindMeTo::VERSION}.gem`
end

task :dev do
  Rake::Task["build"].invoke
  Rake::Task["install"].invoke
end
require "sinatra/activerecord/rake"
require 'irb'

namespace :db do
  task :load_config do
    require "./app/main"
  end
end

desc "console"
task :console do
  require "./app/main"
  ARGV.clear  # To prevent `Errno::ENOENT: No such file or directory @ rb_sysopen - console`
  IRB.start
end

desc "Run tests"
task :spec do
  sh "bundle exec rspec"
end

task default: :spec

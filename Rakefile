require "sinatra/activerecord/rake"
require 'irb'

namespace :db do
  task :load_config do
    require "./app"
  end
end

desc "console"
task :console do
  require "./app"
  ARGV.clear  # To prevent `Errno::ENOENT: No such file or directory @ rb_sysopen - console`
  IRB.start
end

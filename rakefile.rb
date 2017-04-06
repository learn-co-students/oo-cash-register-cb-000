require_relative 'lib/cash_register.rb'
require 'pry'
require 'rake'

def reload!
  load 'lib/cash_register.rb'
end

task :console do
  Pry.start
end

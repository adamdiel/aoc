#!/usr/bin/env ruby

def question_count(custom)
  party_count = custom.scan(/\n/).count + 1
  
end

filename = ARGV[0]
customs_file = File.open(filename)
customs = customs_file.read


customs = customs.split(/\n{2,}/)

valid_count = 0
customs.each do |custom|
  puts question_count(custom)
end
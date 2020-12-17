#!/usr/bin/env ruby
require 'set'

def password_valid(password)
  password_range, password_key, password = password.split(" ")
  
  minimum, maximum = password_range.split("-").map(&:to_i)

  password_key = password_key.split(":")
  password_key = password_key[0]

  if password.count(password_key) <= maximum and password.count(password_key) >= minimum
   return true
  end

  return false

end

def check_passwords(password_set)
  valid_passwords = 0
  password_set.each do |password|
    if password_valid(password)
      valid_passwords = valid_passwords + 1
    end
  end
  valid_passwords
end

filename = ARGV[0]

password_set = Array.new
File.readlines(filename).each do |line|
  password_set << line
end

puts check_passwords(password_set)
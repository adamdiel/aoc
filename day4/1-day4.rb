#!/usr/bin/env ruby

# byr (Birth Year)
# iyr (Issue Year)
# eyr (Expiration Year)
# hgt (Height)
# hcl (Hair Color)
# ecl (Eye Color)
# pid (Passport ID)
# cid (Country ID)

filename = ARGV[0]
REQUIRED_FIELDS = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]

def has_required_fields?(data)
  REQUIRED_FIELDS.each do | field | 
    unless data.include?(field)
      return false
    end
  end
  return true
end


def is_valid?(passport)
  
  passport = passport.split(" ")
  data = Hash.new
  passport.each do | meta_data |
    meta_data = meta_data.split(":")
    data[meta_data[0]] = meta_data[1]
  end
  return has_required_fields?(data)
end

passport_file = File.open(filename)
passports = passport_file.read


passports = passports.split(/\n{2,}/)

valid_count = 0
passports.each do |passport|
  if is_valid?(passport)
    valid_count += 1
  end
end

puts valid_count

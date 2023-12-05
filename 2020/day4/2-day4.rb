#!/usr/bin/env ruby

# byr (Birth Year) 1920 2002
# iyr (Issue Year) 2010 2020
# eyr (Expiration Year) 2020 2030
# hgt (Height)
#   cm 150 193
#   in 59 76
# hcl (Hair Color) #0-9a-f
# ecl (Eye Color) amb blu brn gry grn hzl oth
# pid (Passport ID) including leading 0's, 9 digits
# cid (Country ID) ignored

filename = ARGV[0]
REQUIRED_FIELDS = ["byr","iyr","eyr","hgt","hcl","ecl","pid","cid"]
EYE_COLORS = ["amb","blu","brn","gry","grn","hzl","oth"]

def check_pid?(pid)
  return false unless pid and pid.length == 9 and pid.to_i
  return true
end

def check_ecl?(ecl)
  return false unless EYE_COLORS.include?(ecl)
  return true
end

def check_hcl?(hcl)
  return false unless hcl
  if hcl.match(/#[a-z0-9]{6}/)
    return true
  end
  return false
end

def check_hgt?(hgt)
  return false unless hgt
  units = hgt[-2..-1] || hgt

  if units == "cm"
    hgt = hgt.delete_suffix('cm').to_i
    if hgt >= 150 and hgt <= 193
      return true
    end
    return false
  end

  if units == "in"
    hgt = hgt.delete_suffix('in').to_i
    if hgt >= 59 and hgt <=76
      return true
    end
    return false
  end

  return false 
end

def check_eyr?(eyr)
  eyr = eyr.to_i
  if eyr >= 2020 and eyr<=2030
    return true
  end
  return false
end

def check_iyr?(iyr)
  iyr = iyr.to_i
  if iyr >= 2010 and iyr<=2020
    return true
  end
  return false 
end

def check_byr?(byr)
  byr = byr.to_i
  if byr >= 1920 and byr <= 2002
    return true
  end
  return false 
end

def has_required_fields?(data)

  return false unless check_byr?(data["byr"])
  return false unless check_iyr?(data["iyr"])
  return false unless check_eyr?(data["eyr"])
  return false unless check_hgt?(data["hgt"])
  return false unless check_hcl?(data["hcl"])
  return false unless check_ecl?(data["ecl"])
  return false unless check_pid?(data["pid"])

  return true
end


def is_valid?(passport)
  
  passport = passport.split(" ")
  data = Hash.new
  passport.each do | meta_data |
    meta_data = meta_data.split(":")
    unless REQUIRED_FIELDS.include?(meta_data[0])
      return false 
    end
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

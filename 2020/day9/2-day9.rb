#!/usr/bin/env ruby

def find_weakness(xmas_array, number)
  i = 2
  max = xmas_array.length

  while i < max do
    xmas_array.each_cons(i) { |pair| return pair if pair.inject(:+) == number }
    i += 1
  end

end

def find_vuln(xmas_array)
  xmas = []
  xmas_array[0..24].each do | num |
    xmas << num
  end
  
  xmas_array[25..-1].each do | num |
    xmas_addition = []
    xmas.to_a.combination(2) do |x, y|
      xmas_addition << x + y
    end
    if xmas_addition.include?(num)
      xmas_array = xmas_array.drop(1)
      return find_vuln(xmas_array)
    else
      return num
    end
  end

end

filename = ARGV[0]

xmas_array = Array.new
File.readlines(filename).each do |line|
  xmas_array << line.chomp.to_i
end

vuln = find_vuln(xmas_array)

enc_weakness = find_weakness(xmas_array, vuln)

puts enc_weakness.max + enc_weakness.min
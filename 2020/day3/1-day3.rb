#!/usr/bin/env ruby

filename = ARGV[0]

def find_trees(landscape, dx, dy)
  x, y, trees = 0, 0, 0
  # Not doing anything with y yet, might be something I have to care about in part 2
  landscape.shift
  landscape.each do | row |
    x += dx
    # Don't love this because it assumes every line is the same length
    x %= row.length
    trees += 1 if row[x] == "#"
  end
  return trees
end



landscape = Array.new
File.readlines(filename).each do |line|
  landscape << line.chomp("\n")
end

puts find_trees(landscape, 3 , 1)
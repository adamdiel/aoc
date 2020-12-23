#!/usr/bin/env ruby

filename = ARGV[0]

def find_trees(landscape, dx, dy)
  
  x, y, trees = 0, 0, 0

  while y < landscape.length - 1
    x += dx
    y += dy

    x %= landscape[0].length

    trees += 1 if landscape[y][x] == '#'
    
  end

  return trees
end



landscape = File.readlines(filename).map do | line|
  line.chomp("\n")
end

checks = [[1,1],[3,1],[5,1],[7,1],[1,2]]

trees = 0 
checks.each do | x, y |
  local_trees = find_trees(landscape, x, y)

  if trees == 0
    trees = local_trees
  else
    trees = trees * local_trees
  end
end 

puts trees
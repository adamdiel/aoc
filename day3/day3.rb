#!/usr/bin/env ruby

def run_navigation (nav, current_position, nav_points)
  direction = nav[0]
  steps = nav[1].to_i

  case direction
  when 'U'
    steps.times do
      current_position[1] = current_position[1] + 1
      nav_point = current_position[0], current_position[1]
      nav_points.push nav_point
    end
  when 'D'
    steps.times do
      current_position[1] = current_position[1] - 1
      nav_point = current_position[0], current_position[1]
      nav_points.push nav_point
    end
  when 'L'
    steps.times do
      current_position[0] = current_position[0] - 1
      nav_point = current_position[0], current_position[1]
      nav_points.push nav_point
    end
  when 'R'
    steps.times do
      current_position[0] = current_position[0] + 1
      nav_point = current_position[0], current_position[1]
      nav_points.push nav_point
    end
  else
  end

  return nav_points

end

def create_path_array (navigation)
  cordinates = [[0,0]]
  current_position = cordinates[cordinates.length-1]

  navigation = navigation.split(',')

  for nav in navigation
    cordinates = run_navigation(nav, current_position, cordinates)
    current_position = cordinates[cordinates.length-1]
  end

  return cordinates

end

def find_intersects(paths)
    #Going to assume only 2 paths
    intersects = (paths[0] & paths[1])
    puts intersects.inspect
end


filename = ARGV[0]

paths = Array.new

File.readlines(filename).each do |line|
  cordinates = create_path_array(line)

  paths.push cordinates
end

puts paths[1].inspect
puts paths[0].inspect
find_intersects(paths)

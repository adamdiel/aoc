#!/usr/bin/env ruby

def run_navigation (nav, current_position, nav_points)
  direction = nav[0]
  steps = nav[1..-1].to_i

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
end

def find_lowest(overlaps)
  lowest = overlaps[0][0].abs + overlaps[0][1].abs

  if overlaps.length < 2
    return lowest
  else
    for n in overlaps
      if n[0].abs + n[1].abs < lowest
        lowest = n[0].abs + n[1].abs
      end
    end
  end
  return lowest
end

def find_steps_of_intersects(paths, overlaps)
  lowest_steps = -1
  for cordinate in overlaps
    steps = 0
    for path in paths
      steps = steps + path.index(cordinate)
    end
    if lowest_steps == -1
      lowest_steps = steps
    elsif steps < lowest_steps
      lowest_steps = steps
    end
  end
  lowest_steps
end

filename = ARGV[0]

paths = Array.new

File.readlines(filename).each do |line|
  cordinates = create_path_array(line)

  paths.push cordinates
end

overlaps = find_intersects(paths)

puts overlaps.inspect

distance = find_lowest(overlaps)

puts distance

puts find_steps_of_intersects(paths, overlaps)

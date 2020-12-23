#!/usr/bin/env ruby

def find_high(data_array)
  dy = ( data_array[1] - data_array[0] ) / 2
  y = data_array[1] - dy
  return [y, data_array[1]]
end

def find_low(data_array)
  dx = ( data_array[1] - data_array[0] ) / 2
  x = data_array[0] + dx
  return [data_array[0], x]
end

def find_id(boarding_pass)
  rows = boarding_pass[0..6].split('')
  seats = boarding_pass[7..-1].split('')
  row_array = [0, 127] 
  seat_array = [0,7]

  rows.each do | row | 
    if row == 'F'
      row_array = find_low(row_array)
    elsif row == 'B'
      row_array = find_high(row_array)
    else
      exit -1
    end
  end

  seats.each do | seat | 
    if seat == 'L'
      seat_array = find_low(seat_array)
    elsif seat == 'R'
      seat_array = find_high(seat_array)
    else
      exit -1
    end
  end

  if seat_array[0] == seat_array[1] and row_array[0] == row_array[1]
    return row_array[0] * 8 + seat_array[0]
  else
    exit -1
  end
end


filename = ARGV[0]

boarding_passes = Array.new
File.readlines(filename).each do |line|
  boarding_passes << line.chomp("\n")
end


boarding_ids = []
boarding_passes.each do | boarding_pass |
  boarding_ids << find_id(boarding_pass)
end


puts boarding_ids.max


boarding_ids.sort.each_cons(2) do |a,b|
  if a-b == 2 or b-a == 2
    puts a,b
  end
end
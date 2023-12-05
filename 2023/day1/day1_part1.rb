output=0
File.open("day1_input.txt","r") do |file|
    file.each_line do | line | 
        number = line.gsub(/\D/,'').to_i.digits.reverse
        number = "#{number.first}#{number.last}".to_i
        output += number
    end
end

puts output
def convert_string_to_int_array(str)
    number_words = {
      "one" => 1, "two" => 2, "three" => 3, "four" => 4,
      "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9
    }
  
    numbers = []
    (0...str.length).each do |index|
      number_words.each do |word, num|
        if str[index, word.length] == word
          numbers << num
        end
      end
    end
  
    numbers
  end
  

output=0
File.open("day1_input.txt","r") do |file|
    file.each_line do | line | 
        number_string_int = line.split(/(\d+)/).map { |s| s.match?(/\d+/) ? s.to_i : s }
        number_array = []
        number_string_int.each do | item |
            if item.is_a?(String)
                numbers = convert_string_to_int_array(item)
                if numbers.nil?
                    # Do nothing
                else
                    number_array += numbers
                end
            elsif item.is_a?(Integer)
                item.to_s.chars.map(&:to_i).each do |x|
                    number_array << x
                end
            end
        end
        puts line
        new_number = "#{number_array.first}#{number_array.last}".to_i
        puts new_number
        output += new_number
    end
end

puts output
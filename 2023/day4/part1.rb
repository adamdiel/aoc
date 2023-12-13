def find_total_score(winners, numbers)
    current_score = 0.5
    numbers.each do | num |
        if winners.include?(num)
            current_score = current_score * 2
        end
    end
    current_score.floor.to_i
end

def get_nums(data)
    data_array = data.split(' ')
end

total_score = 0 
File.open(File.join(File.dirname(__FILE__), "input.txt"), "r") do |file|
    file.each do | card |
        card = card.split(":")
        data = card[1].split("|")
        winners = get_nums(data[0])
        numbers = get_nums(data[1])
        total_score = total_score + find_total_score(winners, numbers)
    end
end

puts total_score


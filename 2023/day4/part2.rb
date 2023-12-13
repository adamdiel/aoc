require_relative 'scratch_game'

def find_copies(card_game, winners, numbers)
    card_number = card_game
    copies = []
    numbers.each do | num |
        if winners.include?(num)
            copies << card_number + 1 
            card_number += 1
        end
    end
    copies
end

def get_nums(data)
    data_array = data.split(' ')
end
# cards = []
final_cards = []
game_cards = []
File.open(File.join(File.dirname(__FILE__), "test.txt"), "r") do |file|
    file.each do | card |
        card = card.split(":")
        card_game = card[0].split(" ")[1].to_i
        data = card[1].split("|")
        winners = get_nums(data[0])
        numbers = get_nums(data[1])
        game = ScratchGame.new(card_game, numbers, winners)
        game_cards << game
    end
end


final_cards = []
until game_cards.empty?
    top = game_cards.shift
    final_cards << top
    additional_copies = find_copies(top.card_num, top.winners, top.nums) 
    additional_copies.each do | id |
        game = game_cards.find { |obj| obj.card_num == id }
        game_cards << game
        game_cards.sort! { |a, b| a.card_num <=> b.card_num }
    end
end

puts final_cards.length
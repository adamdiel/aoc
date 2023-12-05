def get_game_id(game_header)
    id = game_header.split(" ")
    id = id[1]
end

File.open("input.txt","r") do |file|
    file.each_line do | line |
        game = line.split(":")
        game_id = get_game_id(game[0])
        game_data = game[1]

        puts game_id
        puts game_data
        puts
    end
end
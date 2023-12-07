# Number of Cubes
RED = 12
GREEN = 13
BLUE = 14

def grab_valid(grab)
    grab = grab.split(",")

    grab.each do | colors | 
        color = colors.split(" ")
        if color[1].upcase == "GREEN"
            if color[0].to_i > GREEN
                return false
            else
                break
            end
        elsif color[1].upcase == "RED"
            if color[0].to_i > RED
                return false
            else
               break 
            end
        elsif color[1].upcase == "BLUE"
            if color[0].to_i > BLUE
                return false
            else
               break 
            end
        else
            return false
        end
    end
    return true
end

def game_valid(game_data)
    grabs = game_data.split(";")

    grabs.each do | grab|
        unless grab_valid(grab)
            return false
        end
    end
    return true
end

def get_game_id(game_header)
    id = game_header.split(" ")
    id = id[1]
end

id_sum = 0
File.open("test.txt","r") do |file|
    file.each_line do | line |
        game = line.split(":")
        game_id = get_game_id(game[0]).to_i
        raw_game_data = game[1]

        if game_valid(raw_game_data)
            id_sum += game_id
        end
    end
end


puts id_sum
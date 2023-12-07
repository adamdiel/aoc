def get_power(grab, color_hash)
    grab = grab.split(",")

    grab.each do | colors | 
        color = colors.split(" ")
        color[0] = color[0].to_i
        if color[1].upcase == "GREEN"
            if color[0] > color_hash[:green]
                color_hash[:green] = color[0]
            end
        elsif color[1].upcase == "RED"
            if color[0] > color_hash[:red]
                color_hash[:red] = color[0]
            end
        elsif color[1].upcase == "BLUE"
            if color[0] > color_hash[:blue]
                color_hash[:blue] = color[0]
            end
        end
    end
    return color_hash
end

def get_power_sum(game_data)
    color_hash = {
        blue: 1,
        red: 1,
        green: 1
    }
    grabs = game_data.split(";")

    grabs.each do | grab|
        color_hash = get_power(grab, color_hash)    
    end
    return color_hash[:blue] * color_hash[:red] * color_hash[:green]
end

power_sum = 0
File.open(File.join(File.dirname(__FILE__), "input.txt"), "r") do |file|
    file.each_line do | line |
        game = line.split(":")
        raw_game_data = game[1]
        power_sum += get_power_sum(raw_game_data)
    end
end


puts power_sum
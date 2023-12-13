def check_sisters(row_index, col_index, num_rows, num_columns, schematic)
    (row_index - 1).upto(row_index + 1) do | row |
        (col_index - 1).upto(col_index + 1) do | col |
            if row.between?(0, num_rows) && col.between?(0, num_columns) && !(row == row_index && col == col_index)
                if schematic[row][col].is_a?(Integer)
                elsif schematic[row][col] == "."
                else
                    return true
                end
            end
        end
    end
    return false
end

def check_row(row, schematic, row_number, num_rows, num_columns)
    part_sum = 0
    part_number = []
    valid_part_number = false

    row.each_with_index do | part_char, index |
        # if we know valid_part_number is true, we know previous was an integer therefor current number. So if this char is an int, we can just add it to the part_number array. 
        if part_char.is_a?(Integer)
            part_number << part_char
            unless valid_part_number
                valid_part_number = check_sisters(row_number, index, num_rows, num_columns, schematic)   
            end
            # check to see if the next char is a ., if it is, check valid_part_numb, add, reset everything. 
            if index+1 == num_columns+1 || !row[index+1].is_a?(Integer)
                part_sum += part_number.join.to_i if valid_part_number
                puts part_number.join.to_i if valid_part_number
                part_number = []
                valid_part_number = false
            end
        end
    end
    return part_sum
end

File.open(File.join(File.dirname(__FILE__), "input.txt"), "r") do |file|
    engine_schematic = []
    file.each_line do | line |
        engine_schematic << line.chomp.chars.map { |char| char.match?(/\d/) ? char.to_i : char }
    end

    num_rows = engine_schematic.length-1
    num_colunms = engine_schematic[0].length-1

    parts_list = []
    row_number = 0
    parts_sum = 0 
    engine_schematic.each do | row |
        parts_sum += check_row(row, engine_schematic, row_number, num_rows, num_colunms)
        row_number += 1
    end

    puts parts_sum
end
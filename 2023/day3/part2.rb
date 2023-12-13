def check_sisters(row_index, col_index, num_rows, num_columns, schematic)
    star_indexes = []
    (row_index - 1).upto(row_index + 1) do | row |
        (col_index - 1).upto(col_index + 1) do | col |
            if row.between?(0, num_rows) && col.between?(0, num_columns) && !(row == row_index && col == col_index)
                if schematic[row][col] == '*'
                    star_indexes << [row, col]
                else
                end
            end
        end
    end
    return star_indexes unless star_indexes.empty?
end

def check_row(row, schematic, row_number, num_rows, num_columns)
    part_number = []
    star_indexes = []
    row_hash = {}

    row.each_with_index do | part_char, index |
        # if we know valid_part_number is true, we know previous was an integer therefor current number. So if this char is an int, we can just add it to the part_number array. 
        if part_char.is_a?(Integer)
            part_number << part_char
            star_index = check_sisters(row_number, index, num_rows, num_columns, schematic) 
            star_indexes << star_index unless star_index.nil?
            # check to see if the next char is a ., if it is, check valid_part_numb, add, reset everything. 
            if index+1 == num_columns+1 || !row[index+1].is_a?(Integer)
                unless star_indexes.empty?
                    puts star_indexes[0]
                    star_indexes[0].each do | key |
                        row_hash[key] ||= []
                        row_hash[key] += [part_number.join]
                    end
                end
                #Moving this outside the loop because regardless if its 0, we need to reset
                part_number = []
                star_indexes = []
            end
        end
    end
    return row_hash
end

File.open(File.join(File.dirname(__FILE__), "input.txt"), "r") do |file|
    part_hash = {}
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
        part_hash = part_hash.merge(check_row(row, engine_schematic, row_number, num_rows, num_colunms)) do | key, old_val, new_val |
            old_val + new_val
        end
        row_number += 1
    end

    part_sum = 0
    puts part_hash
    part_hash.each do | key, value |
        unless value.length < 2
            gear_ratio = 1
            value.each do | valid_part_number |
                gear_ratio = gear_ratio * valid_part_number.to_i
            end
            part_sum += gear_ratio
        end
    end

    puts part_sum
end
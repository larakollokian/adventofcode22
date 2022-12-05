def part_one_example
    stacks = {
        "1": ["Z", "N"],
        "2": ["M", "C", "D"],
        "3": ["P"]
    }
    File.readlines('day5/example_input.txt').each do |line|
        unless line[0] != 'm'
            params = line.split
            amount = params[1]
            source = params[3]
            destination = params[5]
            stacks = move_supplies_9000(stacks, amount, source, destination)
        end
    end
    
    puts stacks
    puts stacks[:"1"].pop + 
        stacks[:"2"].pop + 
        stacks[:"3"].pop
end

def part_one
    stacks = {
        "1": ["R", "S", "L", "F", "Q"],
        "2": ["N", "Z", "Q", "G", "P", "T"],
        "3": ["S", "M", "Q", "B"],
        "4": ["T", "G", "Z", "J", "H", "C", "B", "Q"],
        "5": ["P", "H", "M", "B", "N", "F", "S"],
        "6": ["P", "C", "Q", "N", "S", "L", "V", "G"],
        "7": ["W", "C", "F"],
        "8": ["Q", "H", "G", "Z", "W", "V", "P", "M"],
        "9": ["G", "Z", "D", "L", "C", "N", "R"]
    }
    File.readlines('day5/input.txt').each do |line|
        unless line[0] != 'm'
            params = line.split
            amount = params[1]
            source = params[3]
            destination = params[5]
            stacks = move_supplies_9000(stacks, amount, source, destination)
        end
    end
    
    puts stacks
    puts stacks[:"1"].pop + 
        stacks[:"2"].pop + 
        stacks[:"3"].pop +
        stacks[:"4"].pop +
        stacks[:"5"].pop +
        stacks[:"6"].pop +
        stacks[:"7"].pop +
        stacks[:"8"].pop +
        stacks[:"9"].pop
end

def part_two
    stacks = {
        "1": ["R", "S", "L", "F", "Q"],
        "2": ["N", "Z", "Q", "G", "P", "T"],
        "3": ["S", "M", "Q", "B"],
        "4": ["T", "G", "Z", "J", "H", "C", "B", "Q"],
        "5": ["P", "H", "M", "B", "N", "F", "S"],
        "6": ["P", "C", "Q", "N", "S", "L", "V", "G"],
        "7": ["W", "C", "F"],
        "8": ["Q", "H", "G", "Z", "W", "V", "P", "M"],
        "9": ["G", "Z", "D", "L", "C", "N", "R"]
    }
    File.readlines('day5/input.txt').each do |line|
        unless line[0] != 'm'
            params = line.split
            amount = params[1]
            source = params[3]
            destination = params[5]
            stacks = move_supplies_9001(stacks, amount, source, destination)
        end
    end
    
    puts stacks
    puts stacks[:"1"].pop + 
        stacks[:"2"].pop + 
        stacks[:"3"].pop +
        stacks[:"4"].pop +
        stacks[:"5"].pop +
        stacks[:"6"].pop +
        stacks[:"7"].pop +
        stacks[:"8"].pop +
        stacks[:"9"].pop
end

def move_supplies_9000(stacks, amount, source, destination)
    for i in 1..(amount.to_i) do
        item = stacks[source.to_sym].pop
        stacks[destination.to_sym].push(item)
    end
    stacks
end

def move_supplies_9001(stacks, amount, source, destination)
    items = stacks[source.to_sym].pop(amount.to_i)
    items.each do |item|
        stacks[destination.to_sym].push(item)
    end
    stacks
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
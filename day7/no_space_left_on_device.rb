def part_one
    path = []
    file_system = {}
    # https://stackoverflow.com/questions/51773296/use-an-array-to-access-nested-hash-keys
    file_system.default_proc = -> (h, k) { h[k] = Hash.new(&h.default_proc) }
    current_size = 0
    File.readlines('day7/input.txt').each do |line|
        if entering_directory?(line)
            # puts "entering"
            directory_name = line.split.last
            nest(file_system, path + ["files"], current_size)
            path.push(directory_name)
        elsif listing_directory?(line)
            # puts "listing"
            current_size = 0
        elsif exiting_directory?(line) 
            # puts "exiting"
            nest(file_system, path + ["files"], current_size)
            leaving = path.pop
        else
            # puts "counting"
            current_size = current_size + line.split.first.to_i unless directory?(line)
        end 
    end
    # finish off the parsing
    nest(file_system, path + ["files"], current_size)

    puts file_system

    # sum <= file_system.values.sum { |value| value < 100000 ? value : 0 }
    # puts sum
end

def part_two
end

def entering_directory?(line)
    /\$ cd /.match(line) && !exiting_directory?(line)
end

def listing_directory?(line)
    /\$ ls/.match(line)
end

def exiting_directory?(line)
    /\$ cd \.\./.match(line)
end

def directory?(line)
    /dir /.match(line)
end

# https://stackoverflow.com/questions/51773296/use-an-array-to-access-nested-hash-keys
def nest(hash, path, value)
    if path[0] != "files"
        hash.dig(*path[0..-2])[path.fetch(-1)] == {} ? 
            hash.dig(*path[0..-2])[path.fetch(-1)] = value : 
            hash.dig(*path[0..-2])[path.fetch(-1)] = hash.dig(*path[0..-2])[path.fetch(-1)] + value
    end
    hash
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
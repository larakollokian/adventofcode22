def part_one
    path = []
    file_system = {}
    current_size = 0
    File.readlines('day7/example_input.txt').each do |line|
        if entering_directory?(line)
            directory_name = line.split.last
            puts "starting"
            puts directory_name
            puts "previous current_size"
            puts current_size
            deep_set(file_system, path + ["files"], current_size)
            path.push(directory_name)
        elsif listing_directory?(line)
            current_size = 0
        elsif exiting_directory?(line) 
            # deep_set(file_system, path + ["files"], current_size)
            leaving = path.pop
            puts "exiting"
            puts leaving
            # puts current_size
        else
            puts "line size"
            puts line.split.first.to_i unless directory?(line)
            current_size = current_size + line.split.first.to_i unless directory?(line)
        end 
    end

    # finish off the parsing
    puts "previous current_size"
    puts current_size
    deep_set(file_system, path + ["files"], current_size)

    puts file_system
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
    /\$ cd ../.match(line)
end

def directory?(line)
    /dir /.match(line)
end

# https://stackoverflow.com/questions/51773296/use-an-array-to-access-nested-hash-keys
def deep_set(hash, path, value)
    *path, final_key = path
    to_set = path.empty? ? hash : hash.dig(*path)
  
    return unless to_set
    to_set[final_key] = value
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
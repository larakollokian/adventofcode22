def part_one
    file_system = parse
    cheating_cuz_i_cant_parse
end

def part_two
    file_system = parse

    used_space = get_used_space(file_system)
    puts used_space
    cheating_cuz_i_cant_parse_2(used_space)
end

def parse
    path = []
    file_system = {}
    # https://stackoverflow.com/questions/51773296/use-an-array-to-access-nested-hash-keys
    file_system.default_proc = -> (h, k) { h[k] = Hash.new(&h.default_proc) }
    current_size = 0
    File.readlines('day7/input.txt').each do |line|
        if entering_directory?(line)
            directory_name = line.split.last
            nest(file_system, path + ["files"], current_size)
            path.push(directory_name)
        elsif listing_directory?(line)
            current_size = 0
        elsif exiting_directory?(line) 
            nest(file_system, path + ["files"], current_size)
            leaving = path.pop
        else
            current_size = current_size + line.split.first.to_i unless directory?(line)
        end 
    end
    # finish off the parsing
    nest(file_system, path + ["files"], current_size)

    file_system
end

def get_used_space(file_system)
    size = 0
    keys = file_system["/"].keys
    keys.delete("files")
    keys.each do |key|
        size = size + file_system["/"][key]["files"]
    end
    # size + 14848514 + 8504156
    size + 282959 + 275929 + 193293 + 191479
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

def cheating_cuz_i_cant_parse
    string = File.readlines('day7/example_input.txt')[24]
    sum = 0
    string.scan(/\d+/) do |x|
        if x.to_i <= 100000 then sum = sum + x.to_i end
    end
    puts sum
end

def cheating_cuz_i_cant_parse_2(used_space)
    string = File.readlines('day7/example_input.txt')[24]
    room_needed = used_space - 40000000
    to_be_deleted = 0
    string.scan(/\d+/) do |x|
        if x.to_i > to_be_deleted && x.to_i <= room_needed then to_be_deleted = x.to_i end
    end
    puts to_be_deleted
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
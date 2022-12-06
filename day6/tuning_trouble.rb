def part_one
    File.readlines('day6/input.txt').each do |line|
        first = 0
        last = 3
        while last < line.length do
            buffer = line[first..last]
            if no_matching_characters?(buffer) then
                puts last + 1
                break
            end
            first = first + 1
            last = last + 1
        end
    end
end

def part_two
    File.readlines('day6/input.txt').each do |line|
        first = 0
        last = 13
        while last < line.length do
            buffer = line[first..last]
            if no_matching_characters?(buffer) then
                puts last + 1
                break
            end
            first = first + 1
            last = last + 1
        end
    end
end

def no_matching_characters?(buffer)
    buffer.chars.uniq.length == buffer.length
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
def part_one
    sum = 0
    File.readlines('day3/input.txt').each do |line|
        length = line.length
        string1 = line[0, length/2]
        string2 = line[length/2, length]
        string1.chars.each do |character|
            if string2.include?(character) then
                sum = sum + priority_value(character)
                break
            end
        end
    end
    
    puts sum
end

def upper?(character)
    /[[:upper:]]/.match(character)
end

def priority_value(character)
    if upper?(character) then
        character.bytes[0] - 38
    else
        character.bytes[0] - 96
    end
end

def part_two
    sum = 0
    lines = File.readlines('day3/input.txt')
    (0..lines.length-1).step(3) do |i|
        line1 = lines[i].chars
        line1.sort.uniq
        line2 = lines[i+1].chars
        line2.sort.uniq
        line3 = lines[i+2].chars
        line3.sort.uniq
        line1.each do |character|
            if line2.include?(character) && line3.include?(character) then
                sum = sum + priority_value(character)
                break
            end
        end
    end
    
    puts sum
end

puts "Part 1:"
part_one
puts "\nPart 2:"
part_two
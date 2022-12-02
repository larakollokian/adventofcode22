def part_one
    sum, max = 0, 0
    File.readlines('day1/input.txt').each do |line|
        if line == "\n" then
            max = sum unless max >= sum
            sum = 0
        else
            sum = sum + line.to_i
        end
    end
    
    puts max
end

def part_two
    sum = 0
    top_three = [0, 0, 0]
    File.readlines('day1/input.txt').each do |line|
        if line == "\n" then
            top_three = try_top_three(sum, top_three)
            sum = 0
        else
            sum = sum + line.to_i
        end
    end
    
    puts top_three
    puts "\n"
    puts top_three.sum
end

def try_top_three(sum, top_three)
    top_three.sort!
    if top_three[2] < sum then 
        top_three[0] = top_three[1]
        top_three[1] = top_three[2]
        top_three[2] = sum
    elsif top_three[1] < sum then 
        top_three[0] = top_three[1]
        top_three[1] = sum
    elsif top_three[0] < sum then 
        top_three[0] = sum
    end
    top_three
end

puts "Part one solution:"
part_one
puts "\nPart two solution:"
part_two
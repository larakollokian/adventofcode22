def part_one
    total = 0
    File.readlines('day4/input.txt').each do |line|
        sections = line.split(",")
        section1 = sections.first.split("-")
        section2 = sections.last.split("-")
        if full_overlap?(section1, section2) then
            total = total + 1
        end
    end
    
    puts total
end

def part_two
    total = 0
    File.readlines('day4/input.txt').each do |line|
        sections = line.split(",")
        section1 = sections.first.split("-")
        section2 = sections.last.split("-")
        if overlap?(section1, section2) then
            total = total + 1
        end
    end
    
    puts total
end

def full_overlap?(section1, section2)
    (section1.first.to_i <= section2.first.to_i && section1.last.to_i >= section2.last.to_i) || 
    (section1.first.to_i >= section2.first.to_i && section1.last.to_i <= section2.last.to_i)
end

def overlap?(section1, section2)
    section2.first.to_i <= section1.last.to_i && section1.first.to_i <= section2.last.to_i
end


puts "Part one:"
part_one
puts "\nPart two:"
part_two
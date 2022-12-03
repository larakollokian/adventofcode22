A = {
    win: "B",
    draw: "A",
    lose: "C"
}

B = {
    win: "C",
    draw: "B",
    lose: "A"
}

C = {
    win: "A",
    draw: "C",
    lose: "B"
}

def get_points(hand)
    case hand
    when "X"
    when "A"
        1
    when "Y"
    when "B"
        2
    when "Z"
    when "C"
        3
    end
end

def part_one
    score = 0
    File.readlines('day2/input.txt').each do |line|
        game = line.split(" ")
        score = score + calculate_score(game.first, game.last)
    end
    
    puts score
end

def part_two
    score = 0
    File.readlines('day2/input.txt').each do |line|
        game = line.split(" ")
        score = score + calculate_score_2(game.first, game.last)
    end
    
    puts score
end

def calculate_score(left_hand, right_hand)
    case left_hand
    when "A"
        if right_hand == "Y" then
            get_points(right_hand) + 6
        elsif right_hand == "X" then
            get_points(right_hand) + 3
        else
            get_points(right_hand)
        end 
    when "B"
        if right_hand == "Z" then
            get_points(right_hand) + 6
        elsif right_hand == "Y" then
            get_points(right_hand) + 3
        else
            get_points(right_hand)
        end 
    when "C"
        if right_hand == "X" then
            get_points(right_hand) + 6
        elsif right_hand == "Z" then
            get_points(right_hand) + 3
        else
            get_points(right_hand)
        end 
    end
end

def calculate_score_2(left_hand, move)
    case left_hand
    when "A"
        if move == "X" then
            get_points(A[:lose])
        elsif move == "Y" then
            get_points(A[:draw]) + 3
        else
            get_points(A[:win]) + 6
        end 
    when "B"
        if move == "X" then
            get_points(B[:lose])
        elsif move == "Y" then
            get_points(B[:draw]) + 3
        else
            get_points(B[:win]) + 6
        end 
    when "C"
        if move == "X" then
            get_points(C[:lose])
        elsif move == "Y" then
            get_points(C[:draw]) + 3
        else
            get_points(C[:win]) + 6
        end 
    end
end

puts "Part one: "
part_one
puts "\nPart two: "
part_two
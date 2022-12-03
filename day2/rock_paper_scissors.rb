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
        score = score + calculate_score(game.first, game.last)
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

def get_points(hand)
    case hand
    when "X"
        1
    when "Y"
        2
    when "Z"
        3
    end
end

part_one
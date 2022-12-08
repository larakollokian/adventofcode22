def part_one
    lines = File.readlines('day8/input.txt')
    @width = lines[0].strip.chars.length
    @height = lines.length

    visible_trees = 0
    row = 0
    while row < lines.length do
        column = 0
        line = lines[row].strip.chars
        while column < line.length do
            tree = line[column].to_i

            if tree_along_edge?(row, column) then 
                visible_trees = visible_trees + 1
            else
                vertical_line = lines.map {|line| line[column]}

                left = line[0..column-1]
                right = line[column+1..@width-1]
                up = vertical_line[0..row-1]
                down = vertical_line[row+1..@height-1]

                if visible_from_outside?(tree, left, right, up, down) then
                    visible_trees = visible_trees + 1 
                end
            end
            column = column + 1
        end
        row = row + 1
    end

    puts visible_trees
end

def part_two
    lines = File.readlines('day8/input.txt')
    @width = lines[0].strip.chars.length
    @height = lines.length

    max_scenic_score = 0
    row = 0
    while row < lines.length do
        column = 0
        line = lines[row].strip.chars
        while column < line.length do
            tree = line[column].to_i
            vertical_line = lines.map {|line| line[column]}
            scenic_score = 0

            left = line[0..column-1]
            right = line[column+1..@width-1]
            up = vertical_line[0..row-1]
            down = vertical_line[row+1..@height-1]

            scenic_score = get_scenic_score(tree, left, right, up, down) unless tree_along_edge?(row, column)
            if scenic_score > max_scenic_score
                max_scenic_score = scenic_score
            end

            column = column + 1
        end
        row = row + 1
    end

    puts max_scenic_score
end

def tree_along_edge?(row, column)
    row == 0 || 
        row == @width - 1 || 
        column == 0 || 
        column == @height - 1
end

def visible?(tree, other_trees)
    !other_trees.include?(tree) && other_trees.max.to_i < tree.to_i
end

def visible_from_outside?(tree, left, right, up, down)
    visible?(tree, left) || 
        visible?(tree, right) ||
        visible?(tree, up) ||
        visible?(tree, down)
end

def get_scenic_score(tree, left, right, up, down)
    scenic_score = 1
    left.reverse!
    up.reverse!
    [left, right, up, down].each do |path|
        index = 0
        while index < path.length do
            if path[index].to_i <= tree.to_i then
                if path[index].to_i == tree.to_i || index + 1 == path.length
                    scenic_score = scenic_score * (index + 1)
                    break
                end
                index = index + 1
            else
                scenic_score = scenic_score * (index + 1)
                break
            end
        end
    end
    scenic_score
end

puts "Part one:"
part_one
puts "\nPart two:"
part_two
INPUTS = File.readlines('./inputs/day_3.txt', chomp: true)
HEIGHT = INPUTS.size
WIDTH = INPUTS.first.size

def ski(x_path, y_path)
  x, y = 0, 0
  path = ''
  while y < HEIGHT
    path += INPUTS[y][x]
    x = (x + x_path) % WIDTH
    y += y_path
  end

  path.count('#')
end

# part one
p ski(3,1)

# part two
listed_slopes = [[1,1], [3,1], [5,1], [7,1], [1,2]]
p listed_slopes.map { |slope| ski(slope[0], slope[1]) }.reduce(:*)
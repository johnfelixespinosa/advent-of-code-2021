file = File.open("day1-input.txt")
input = file.readlines.map(&:chomp)
ints = input.map { |i| i.to_i }

def evaluate(ints)
  ints.each_cons(2).select { |x, y| x < y }
end

puts evaluate(ints).size

# file = File.open("day1-input.txt")
# input = file.readlines.map(&:chomp).map { |i| i.to_i }

class Measurer
  def initialize
    @input = File.open("day1-input.txt").readlines.map(&:chomp).map { |i| i.to_i }
  end

  # Part 1
  def evaluate_single_measurements
    @input.each_cons(2).select { |x, y| x < y }
  end

  # Part 2
  def evaluate_window_measurements
    last_window = @input.size - 1
    @input.each_with_index.select do |value, index|
      next_index = index + 1
      next if index.zero? || index == last_window

      window_finder(index).sum < window_finder(next_index).sum
    end
  end

  def window_finder(index)
    window_size = index + 2

    @input[index..window_size]
  end
end

puts "Day 1 Pt. 1 answer #{Measurer.new.evaluate_single_measurements.size}"
puts "Day 1 Pt. 2 answer #{Measurer.new.evaluate_window_measurements.size}"

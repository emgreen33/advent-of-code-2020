INPUTS = File.readlines('./inputs/day_1.txt', chomp: true).each_with_object([]) { |line, memo| memo << line.to_i }


class MatchingRecords
  attr_reader :inputs, :combo_count, :goal

  def initialize(combo_count = 2, inputs = INPUTS, goal = 2020)
    @inputs = inputs
    @combo_count = combo_count
    @goal = goal
  end

  def contains_pair_for_sum?
    !!inputs.uniq.combination(combo_count).find do |args|
      if correct_sum?(args)
        return "#{multiplied(args)} (#{args})"
      end
    end
  end

  def correct_sum?(numbers)
    numbers.inject(:+) == goal
  end

  def multiplied(numbers)
    numbers.reduce(:*)
  end
end

# --- Day 1: Report Repair ---

# -- Part One ---
# Find the two entries that sum to 2020 and then multiply those two numbers together.

p MatchingRecords.new.contains_pair_for_sum?

# --- Part Two ---
# What is the product of the three entries that sum to 2020?

p MatchingRecords.new(3).contains_pair_for_sum?

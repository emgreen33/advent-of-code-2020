#   The first half of this puzzle is complete! It provides one gold star: *
#
# --- Part Two ---
# The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over
# from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the
# same criteria.
#
#   Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together
# produces the answer, 241861950.
#
#   In your expense report, what is the product of the three entries that sum to 2020?
#
require_relative './part_1'
include DayOne

MATCHING_TRI = []
def contains_tri_for_sum?
  !!DayOne::INPUT.uniq.combination(3).detect do |a, b, c|
    if a + b + c == 2020
      MATCHING_TRI << [a, b, c]
    end
  end
end

if contains_tri_for_sum?
  MATCHING_TRI.each do |pair|
    p "three matching numbers are: #{pair[0]}, #{pair[1]} and #{pair[2]}"
    p "correct answer is: #{pair[0] * pair[1] * pair[2]}"
  end
end

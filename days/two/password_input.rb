class PasswordInput
  attr_reader :min, :max, :matcher, :password

  def initialize(info)
    @min = info[0].to_i
    @max = info[1].to_i
    @matcher = info[2]
    @password = info[3]
  end

  def valid_count?
    count.between?(min, max)
  end

  def valid_occurrences?
    (index_one_match? && !index_two_match?) ^ (!index_one_match? && index_two_match?)
  end

  private

  def count
    password.count(matcher)
  end

  def index_one_match?
    return @index_one_matches if defined? @index_one_matches
    @index_one_matches = password[min - 1] == matcher
  end

  def index_two_match?
    return @index_two_match if defined? @index_two_match
    @index_two_match = password[max - 1] == matcher
  end
end

PASSWORDS = File.readlines('./inputs/day_2.txt', chomp: true).each_with_object([]) do |line, memo|
  info = line.sub('-', ' ').sub(':', ' ').split(' ')
  memo << ::PasswordInput.new(info)
end

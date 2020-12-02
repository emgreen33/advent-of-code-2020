class PasswordInput
  attr_reader :min, :max, :matcher, :password

  def initialize(info)
    @min = info[0].to_i
    @max = info[1].to_i
    @matcher = info[2]
    @password = info[3]
  end

  def count
    password.count(matcher)
  end

  def valid_count?
    count.between?(min, max)
  end

  def index_one_match?
    @index_one ||= password[min - 1] == matcher
  end

  def index_two_match?
    @index_two ||= password[max - 1] == matcher
  end

  def valid_occurrences?
    return true if index_one_match? && !index_two_match?
    return true if !index_one_match? && index_two_match?
    false
  end
end

PASSWORDS = File.readlines('./inputs/day_2.txt', chomp: true).each_with_object([]) do |line, memo|
  info = line.sub('-', ' ').sub(':', ' ').split(' ')
  memo << ::PasswordInput.new(info)
end

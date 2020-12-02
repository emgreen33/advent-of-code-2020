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

  def index_one
    password[min - 1]
  end

  def index_two
    password[max - 1]
  end

  def valid_occurrences?
    return true if index_one == matcher && index_two != matcher
    return true if index_one != matcher && index_two == matcher
    false
  end
end

PASSWORDS = File.readlines('./inputs/day_2.txt', chomp: true).each_with_object([]) do |line, memo|
  info = line.sub('-', ' ').sub(':', ' ').split(' ')
  memo << ::PasswordInput.new(info)
end
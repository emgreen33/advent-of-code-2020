# ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
#   byr:1937 iyr:2017 cid:147 hgt:183cm
#
# iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
# hcl:#cfa07d byr:1929
#
#   hcl:#ae17e1 iyr:2013
#   eyr:2024
# ecl:brn pid:760753108 byr:1931
# hgt:179cm
#
# hcl:#cfa07d eyr:2025 pid:166559648
#   iyr:2011 ecl:brn hgt:59in

# Count the number of valid passports - those that have all required fields. Treat cid as optional.
# In your batch file, how many passports are valid?

class Passport
  REQUIRED_FIELDS = %w(byr iyr eyr hgt hcl ecl pid).freeze
  OPTIONAL_FIELDS = %i(cid)
  EYE_CLR = %w(amb blu brn gry grn hzl oth).freeze
  PID = /^[0-9]{9}$/
  HAIR = /^#[0-9a-f]{6}$/

  attr_reader :fields

  def initialize(input)
    @fields = input
  end

  def keys_present?
    REQUIRED_FIELDS.all? { |f| fields.key?(f) }
  end

  def validated?
    keys_present? && valid_byr? && valid_iyr? && valid_eyr? && valid_height? &&
      HAIR === fields['hcl'] &&
      EYE_CLR.include?(fields['ecl']) &&
      PID === fields['pid']
  end

  private

  def valid_byr?
    fields['byr'].to_i.between?(1920, 2002)
  end

  def valid_iyr?
    fields['iyr'].to_i.between?(2010, 2020)
  end

  def valid_eyr?
    fields['eyr'].to_i.between?(2020, 2030)
  end

  def valid_height?
    val = fields['hgt']
    return val.to_i.between?(150, 193) if /^(\d+)cm$/ === val
    val.to_i.between?(59, 76) if /^(\d+)in$/ === val
  end
end

INPUT = File.read('./inputs/day_4.txt', chomp: true)
passports = INPUT.split("\n\n").map do |p|
  cleaned = p.split(/\s+/).map { |f| f.split(':') }.to_h
  Passport.new(cleaned)
end

# --- Part One ---
p passports.count(&:keys_present?)

# --- Part Two ---
p passports.count(&:validated?)

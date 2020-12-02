require_relative 'password_input'

# -- Part One ---
# Each line gives the password policy and then the password. The password policy indicates the lowest and highest number
# of times a given letter must appear for the password to be valid.
# How many passwords are valid according to their policies?

def valid_password_count
  PASSWORDS.select { |password_info| password_info.valid_count? }.size
end

p "There are #{valid_password_count} valid passwords"

# --- Part Two ---
# Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant
# How many passwords are valid according to the new interpretation of the policies?

def valid_occurrence_count
  PASSWORDS.select { |data| data.valid_occurrences? }.size
end

p "There are #{valid_occurrence_count} valid passwords"
require './spec/spec_helper'

RSpec.describe '' do
  subject(:records) { MatchingRecords.new(inputs) }
  let(:inputs) { [1, 400, 800, 492, 1528] }
end

require 'spec_helper'

describe Scanner do
  describe 'begin' do
    it 'starts scanning' do
      expect(Scanner.begin).to be true
    end
  end
end

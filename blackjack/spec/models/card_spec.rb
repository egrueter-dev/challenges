require 'spec_helper'

describe Card do
  describe 'initial state' do
    it 'suit and value' do
      card = Card.new("9", "spades")
      expect(card.value).to eq "9"
      expect(card.suit).to eq "spades"
    end
  end
end

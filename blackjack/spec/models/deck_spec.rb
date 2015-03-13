describe Deck do

  describe "#cards" do
    it 'returns an array of 52 card objects' do
      deck = Deck.new
      expect(deck.cards.count).to eq 52
      expect(deck.cards.first).to be_a_kind_of Card
    end
  end

  describe 'shuffle card deck' do
    it 'randomly ressorts deck' do
      deck = Deck.new
      cards = double("cards")
      deck.instance_variable_set(:@cards, cards)
      expect(cards).to receive(:shuffle)
      deck.shuffle
    end
  end

  describe 'draw a card from deck' do
    it 'pulls a card from the top of the deck, and removes it from the deck' do
      deck = Deck.new
      expect(deck.draw_card).to be_a_kind_of Card
      expect(deck.cards.count).to eq 51
    end
  end
end

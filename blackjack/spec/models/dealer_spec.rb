describe Dealer do

  describe "new deck" do
    it "Creates a new deck for the game" do
      dealer_1 = Dealer.new
      expect(dealer_1.new_deck).to be_a_kind_of(Deck)
    end
  end

  describe "deal card" do
    it "deals a new card to the target player" do
     deck = Deck.new
     dealer_1 = Dealer.new
     card1 = Card.new(10,"ACE")
     player = Human.new
     expect(dealer_1.deal(player)
    end
  end

  #dealer takes player_name, passes player(hand) a new card.

end


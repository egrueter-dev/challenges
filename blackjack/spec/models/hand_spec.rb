describe Hand do
  describe "cards in hand" do
    it "Should return all instances of the class card in the hand" do
      hand = Hand.new
      card = Card.new(10, "spades")
      expect(hand.cards_in_hand(card)).to be_a_kind_of Array
      expect(hand.cards_in_hand(card).first).to be_a_kind_of Card
    end
  end

  describe "Return the number of aces in the hand." do
    it "Should return the number of aces in the hand." do
      hand = Hand.new
      card1 = Card.new(10,"ACE")
      card2 = Card.new(10,"ACE")
      hand.cards_in_hand(card1)
      hand.cards_in_hand(card2)
      expect(hand.has_ace).to eq(2)
    end
  end

  describe "Returns the value of the hand" do
    it "should return the numerical value of the hand" do
      hand = Hand.new
      card1 = Card.new(10,"ACE")
      hand.cards_in_hand(card1)
      expect(hand.hand_value).to eq(10)
    end
  end

  describe "Determines if the hand is bust" do
    it "should return true if hand_value over 22" do
      player_hand = Hand.new
      card1 = Card.new(22,"ACE")
      player_hand.cards_in_hand(card1)
      player_hand.hand_value
      expect(player_hand.bust?).to eq(true)
    end

    it "should return false if hand_value under 21" do
      player_hand = Hand.new
      hand_value = 19
      expect(player_hand.bust?).to eq(false)
    end
  end


end

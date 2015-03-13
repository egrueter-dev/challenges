describe Human do

  describe "initialize human" do
    it "initializes the human class" do
      expect(human = Human.new)
    end
  end

  describe "human has hand" do
    it "creates an initial empty hand for the user" do
      player = Human.new
      expect(player.hand).to be_a_kind_of(Hand)
   end
  end

  describe "human receives card into hand from dealer" do
    it "adds a new card to the player's hand" do
       player = Human.new
       expect(dealer.deal(player)
    end
 end
end

#   describe "stay" do
#     it "stops the player score and returns the hand value" do
#       player_hand = Hand.new
#       card = Card.new(10,"Spades")
#       player_hand.hand_value(card)
#       expect(human)
#
#     end


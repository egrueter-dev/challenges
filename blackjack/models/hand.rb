class Hand
  def initialize
    @cards = []
  end

  def cards_in_hand(card)
    @cards << card
  end

  def has_ace
    @cards.count {|card| card.suit = "ACE"}
  end

  def hand_value
    @hand_value = 0
    @cards.each { |card| @hand_value += card.value }
    @hand_value
  end

  def bust?
    hand_value > 21
  end


end

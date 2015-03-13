class Deck
  attr_reader :cards

  SUITS = ['spades', 'clover', 'heart', 'diamond']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9','10','J',"Q", "K","ACE"]
  ROYALTY = ['J','Q','K','ACE']

  def initialize
    @cards = []
    create_deck
  end

  def draw_card
    @cards.shift
  end

  def shuffle
    @cards.shuffle
  end

  private
  def create_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end

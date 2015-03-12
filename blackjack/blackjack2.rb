#!/usr/bin/env ruby
require 'pry'

SUITS = ['spades', 'clover', 'heart', 'diamond']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9','10','J',"Q", "K","ACE"]
ROYALTY = ['J','Q','K','ACE']

class PlayingCard
  attr_accessor :value, :suit

  def initialize(value, suit)
    @suit = suit
    @value = value
  end
end

class Deck
  attr_reader :deck_of_cards

  def initialize(suits,values)
    @suits = suits
    @values = values
    @deck_of_cards = []
  end

  def create_deck
    @suits.each do |suit|
      @values.each do |value|
        @deck_of_cards << PlayingCard.new(value,suit)
      end
    end
    @deck_of_cards
  end

  def cards_in_deck
    @deck_of_cards
  end

  def shuffle_deck
    cards_in_deck.shuffle
  end

  def draw_card
    cards_in_deck.shift
  end

end

deck = Deck.new(SUITS,VALUES)
deck.create_deck
binding.pry

#The hand stores and updates it's value, it also knows if is bust and
#If it has an ace.
#The hand takes cards, not a deck

class Hand
  def initialize
  end

  def hand_cards(card)
    @hand_cards << card
  end

  def hand_value
    value_of_hand = 0
    @hand_cards.each do |card|
      if card.value == 'J' || card.value == 'Q' || card.value == 'K'
        card.value = 10
        value_of_hand += card.value.to_i
      else
        value_of_hand += card.value.to_i
      end
    value_of_hand
  end

  def ace?
  end

  def ace_count
    @hand_cards.count { |card| card.suit = "ACE" }
  end

end

#player hits, stays, and decides if he should change
#the value of the ace.

class Human
  attr_reader :name
  def initialize
    @name = "Human"
  end

  def hit
    # A dealer deals new card into players hand.
    # A dealer's hand value is displayed
    # If dealer goes bust, bust message is sent by the game.
  end

  def stay
    Game.new(dealer) #initiates the dealer's game.
  end

  def ace_conditon
  end

end

#The dealer deals cards, hits/stays, and can change the value of the ace
# the dealer also creates a new hand for the player and himself

class Dealer
  attr_reader :name
  def initialize
    @name = "Dealer"
  end

  def deck_shuffle
    deck.shuffle!
  end

  def deal
    #dealer deals to himself or player
  end

  def hit
  end

  def stay
    #this ends the game.
  end

  def ace_conditon
  end

end

#the game starts by running the player's game.

class Game
  def initialize(player)
  end

  def initial_deal
    #Dealer deals 2 cards into current player's hand
  end

  def bust?
    if hand_value > 21 : bust_message
  end

  def bust_message
    "#{player.name} Went Bust!"
  end

  def victory
    "#{player.name} is the winner! ADD SCORE"
  end
end

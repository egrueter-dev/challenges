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

  def shuffle_deck
    create_deck.shuffle
  end
end

class Hand
  def initialize(deck,name)
    @deck = deck
    @name = name
    @hand = [ ]
  end

  def first_deal
    card_1 = @deck.sample
    card_2 = @deck.sample
    @hand << card_1
    @hand << card_2
    puts "#{@name} is dealt a #{card_1.value} of #{card_1.suit} and #{card_2.value} of #{card_2.suit}"
    hand_value
    hit_or_stand
  end

  def hand_value
    @value_of_hand = 0
    @hand.each do |card|
      if card.value == 'J' || card.value == 'Q' || card.value == 'K'
        card.value = 10
        @value_of_hand += card.value.to_i
      else
        @value_of_hand += card.value.to_i
      end
    end
    puts "#{@name} Score: #{@value_of_hand}"
    @value_of_hand
  end

  def hit_or_stand
    puts "Hit or stand (H/S):"
    response = gets.chomp
    bust_or_not(response)
  end

  def ace_count
    @hand.count {|card| card.value = "ACE"}
  end

  def bust?
    hand_value > 21
  end

  def bust_or_not(response)
    if response == "H"
        deal_card
        if bust?
          puts "bust!"
        else
          hit_or_stand
        end
    else response == "S"
        puts "#{@name}'s score is #{hand_value}"
    end
  end

  def deal_card
    card = @deck.sample
    @hand << card
    puts "#{@name} is dealt #{card.suit}, #{card.value}"
  end
end

deck = Deck.new(SUITS,VALUES)
game_deck = deck.create_deck
player_hand = Hand.new(game_deck,"erik")
dealer_hand = Hand.new(game_deck,"Dealer")
player_hand.first_deal
dealer_hand.first_deal

## Victory Conditions
if dealer_hand.hand_value > player_hand.hand_value && dealer_hand.hand_value < 22
  puts "Dealer Wins!"
elsif dealer_hand.hand_value == player_hand.hand_value
  puts "Tie Game!"
elsif player_hand.hand_value > dealer_hand.hand_value && player_hand.hand_value < 22
  puts "Player Wins!"
end

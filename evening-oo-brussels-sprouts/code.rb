#YOUR CODE GOES HERE
require 'pry'

class Ingredient
  # Returns the summary of an ingredient.
  def initialize(quantity, unit, name)
    @quantity = quantity.to_f
    @unit = unit.to_s
    @name = name.to_s
  end

  def summary
    "- #{@quantity}, #{@unit}, #{@name}"
  end
end

name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

class Recipe

  def initialize(name, ingredients, instructions)
    @name = name
    @ingredients = ingredients
    @instructions = instructions
  end

  def list_ingredients
    puts "Ingredients"
    @ingredients.each do |ingredient|
      puts ingredient.summary
    end
  end

  def list_instructions
    puts "Instructions"
    @instructions.each_with_index do |instruction, index|
      puts instruction
    end
  end
end

recipe = Recipe.new(name, ingredients, instructions)
recipe.list_ingredients
recipe.list_instructions

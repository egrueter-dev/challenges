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

  def self.parse(ingredient) #Making the assumption that this is a string.
    split_string = ingredient.split(" ")
    quantity = split_string[0].to_i
    one_slice = split_string[1].gsub(")", "")
    unit = one_slice.gsub("(", "")
    name = split_string[2]
    Ingredient.new(quantity,unit,name)
  end


  def recipe(ingredient)
    safe = ["brussels sprouts","spinach","eggs","milk","tofu","seitan","bell peppers","quinoa","kale","chocolate","beer","wine","whiskey"]
    if safe.include?(@name.downcase)
        puts "#{@name}....safe to eat."
    else
      puts "#{@name}...not safe to eat!"
    end
  end
end

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


  def check_recipe

  end

end

brussel_sprouts_recipe = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

brussel_sprouts_recipe.each do |ingredient|
  print ingredient.recipe(ingredient)
end

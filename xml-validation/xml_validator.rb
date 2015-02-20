# YOUR CODE GOES HERE

xmlfile = File.read('./samples/invalid/missing-tag.xml')
xmlfile.split
puts xmlfile.split
xmlfile.each

.match(/<[^>]*>/)

# Read in an xml file
# Split up the file into an array of words
# Loop through the array of words
  # for each word, see if it starts with < and ends with >
  # if it does, append it to a collection


 # Split up each character in the string
 # Evaluate each value in the newly created array

 # If the value evaluates, put the item into the stack
 # Remove it from the original string

# while xmlfile.length > 0
#    stack1 << xmlfile.match(/<[^>]*>/)
# end
# Finds any match [<[a-z]*>]


#Creating a proper stack

# class Stack
#   def initialize(size)
#     @size = size #Passing variable to the stack
#     @store = Array.new(@size)
#     @top = -1
#   end
#
#   def size
#     @size
#   end
#
#   def push(element)
#     if full? or element.nil?
#       nil
#     else
#       @size
#     end
#   end
# end
# stack = Stack.new(10)

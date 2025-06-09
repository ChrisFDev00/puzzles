########## Edition 407 ##########
# Turn an array of integers into a nested array. 
# You can think of this as the opposite of flattening an array!

# iterative
def nestArray(arr)
  if arr.empty?
    return []
  end

  nest = [arr.last]

  (arr.length - 2).downto(0) do |i|
    nest = [arr[i], nest]
  end

  nest
end

# recursive
def recursive_nestArray(arr)
  return arr if arr.length <= 1
  
  [arr[0], recursive_nestArray(arr[1..-1])]
end

# p nestArray([1]) #=> [1]
# p nestArray([1, 2, 3, 4]) #=> [1, [2, [3, [4]]]]
# p nestArray([1, 2, 3, 4, 5, 6]) #=> [1, [2, [3, [4, [5, [6]]]]]]

# p recursive_nestArray([1]) #=> [1]
# p recursive_nestArray([1, 2, 3, 4]) #=> [1, [2, [3, [4]]]]
# p recursive_nestArray([1, 2, 3, 4, 5, 6]) #=> [1, [2, [3, [4, [5, [6]]]]]]

########## Edition 408 ##########
# Given an array of strings representing a sequence of traffic light states ("red" for stop, "green" for go, "yellow" for slow), 
# write a function that returns true if the sequence could represent a valid state machine for a standard traffic light. 
# The only valid transitions are: red to green, green to yellow, and yellow to red. 

def isValidTrafficSequence arr
  return true if arr.empty?

  sequence = {
    "red" => "green",
    "green" => "yellow", 
    "yellow" => "red",
  }

  arr.each_cons(2) do |current_light, next_light|
    expected_next = sequence.fetch(current_light, nil)
    return false if next_light != expected_next
  end
  
  true
end

# p isValidTrafficSequence([])
# p isValidTrafficSequence(["red", "green", "yellow", "red", "green"])
# p isValidTrafficSequence(["red", "yellow", "green"]);
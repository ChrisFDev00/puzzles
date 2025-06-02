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

p nestArray([1]) #=> [1]
p nestArray([1, 2, 3, 4]) #=> [1, [2, [3, [4]]]]
p nestArray([1, 2, 3, 4, 5, 6]) #=> [1, [2, [3, [4, [5, [6]]]]]]

p recursive_nestArray([1]) #=> [1]
p recursive_nestArray([1, 2, 3, 4]) #=> [1, [2, [3, [4]]]]
p recursive_nestArray([1, 2, 3, 4, 5, 6]) #=> [1, [2, [3, [4, [5, [6]]]]]]

#############################################################################
require 'benchmark'
def quicksort(collection)
    return collection if collection.empty?
    pivot = collection[collection.length - 1]
    left, right = collection[0..-2].partition {|x| x < pivot}
    quicksort(left) + [pivot] + quicksort(right)
end

testarray = Array.new(50){rand(-10..100)}
            
puts 'Quick Sort'
puts Benchmark.measure{quicksort(testarray)}
require 'benchmark'
def bucket_sort(arr, bucket_size=5)
  max = arr.max
	min = arr.min
	bucket_count = ((max-min)/bucket_size).floor + 1
	buckets = Array.new(bucket_count)
	(0..buckets.length-1).each do |x|
		buckets[x] = []
	end

	(0..arr.length-1).each do |i|
		buckets[((arr[i] - min)/bucket_size).floor].push(arr[i])
	end

	arr.clear
	(0..buckets.length-1).each do |x|
		if buckets[x][0] != nil
			sorted = insertion_sort(buckets[x])
			sorted.each do |y|
				arr.push(y)
			end
		end
	end
	arr
end

def insertion_sort(collection)
   sorted_collection = [collection.delete_at(0)]
   for val in collection
     sorted_collection_index = 0
     while sorted_collection_index < sorted_collection.length
       if val <= sorted_collection[sorted_collection_index]
         sorted_collection.insert(sorted_collection_index, val)
         break
       elsif sorted_collection_index == sorted_collection.length - 1
         sorted_collection.insert(sorted_collection_index + 1, val)
         break
       end
       sorted_collection_index += 1
     end
   end
   sorted_collection
end

testarray = Array.new(50){rand(-10..100)}
puts 'Bucket Sort'
puts Benchmark.measure{bucket_sort(testarray)}
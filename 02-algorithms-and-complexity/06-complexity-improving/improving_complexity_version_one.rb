def poorly_written_ruby(*arrays)
  combined_array = arrays.flatten!
  sorted_array = [combined_array.delete_at(0)]
  for val in combined_array
   i = 0
   while i < sorted_array.length
     if val <= sorted_array[i]
       sorted_array.insert(i, val)
       break
     elsif i == sorted_array.length - 1
       sorted_array.insert(i + 1, val)
       break
     end
     i+=1
   end
  end
 sorted_array
end

a = [0,2,4,6,9,32,1,54,12,345,75,234,84,2134,756,3234,13,78,-1,432,52]
b = [1,3,5,7,23,65,876,234,875,234,764,23,45]
c = [9,6,4,1,45,36,823,25,123,54,-21]

print poorly_written_ruby(a,b,c)
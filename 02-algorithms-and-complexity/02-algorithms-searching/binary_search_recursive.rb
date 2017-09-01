def binary_search(collection, value, low = 0, high = collection.length - 1)
  mid = (low + high) / 2
  if collection[mid] == value
    return mid
  elsif collection[mid] < value
    binary_search(collection, value, low = mid + 1, high)
  else
    binary_search(collection, value, low = 0, high = mid - 1)
  end
end
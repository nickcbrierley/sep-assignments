require 'benchmark'
def heap_sort(array)  
  buildMaxHeap(array)
  lastElement = array.length - 1
  while(lastElement > 0)
    swap(array, 0, lastElement)
    heapify(array, 0, lastElement)
    lastElement -= 1
  end
end  

def buildMaxHeap(array)
  i = (array.length / 2 - 1).floor
  while(i >= 0)
    heapify(array, i, array.length)
    i -= 1
  end
end

def heapify(heap, i, max)
  while(i < max)
    index = i
    leftChild = 2 * i + 1
    rightChild = leftChild + 1
    index = leftChild if (leftChild < max && heap[leftChild] > heap[index]) 
    index = rightChild if (rightChild < max && heap[rightChild] > heap[index])
    return if index === i
    swap(heap, i, index)
    i = index
  end
end

def swap(array, firstItemIndex, lastItemIndex)
  temp = array[firstItemIndex]
  array[firstItemIndex] = array[lastItemIndex]
  array[lastItemIndex] = temp
end

testarray = Array.new(50){rand(-10..100)}
puts 'Heap Sort'
puts Benchmark.measure{heap_sort(testarray)}
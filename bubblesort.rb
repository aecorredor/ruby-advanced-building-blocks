def bubble_sort(array)
  loop do
    counter = 0
    array.each_with_index do |element, index|
      if index != array.length - 1 && element > array[index + 1]
        array[index] = array[index + 1]
        array[index + 1] = element
        counter += 1
      end
    end
    break if counter == 0
  end
  puts array.inspect
end

def bubble_sort_by(array)
  loop do
    counter = 0
    array.each_with_index do |element, index|
      if index != array.length - 1
        comparator = yield(element, array[index + 1])
        if comparator > 0
          array[index] = array[index + 1]
          array[index + 1] = element
          counter += 1
        end
      end
    end
    break if counter == 0
  end
  puts array.inspect
end

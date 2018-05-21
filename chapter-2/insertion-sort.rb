#!/usr/bin/env ruby

# Sort by Insertion Sort
#
# Try to imagine you get a things
# move bigger things to right
# then put it to the right place
module InsertionSort
  class << self
    def insertion_sort!(array)
      (1...array.length).each do |holding_index|
        holdind = get(array, holding_index)
        place_to = right_shift(array, holdind, holding_index)
        put(array, place_to, holdind)
      end
    end

    def insertion_sort(array)
      new = array.dup
      insertion_sort!(new)
      new
    end

    private_class_method

    def get(array, index)
      array[index]
    end

    def right_shift(array, holding, holding_index)
      right_shifting_index = holding_index - 1
      loop do
        break if right_shifting_index < 0
        need_right_shift = array[right_shifting_index]
        break if need_right_shift < holding # Get to the right place
        array[right_shifting_index + 1] = need_right_shift
        right_shifting_index -= 1
      end
      right_shifting_index + 1 # Correct - 1
    end

    def put(array, index, value)
      array[index] = value
    end
  end
end

# rubocop:disable MethodLength
def insertion_sort!(array)
  (1...array.length).each do |current_index|
    current = array[current_index]
    before_index = current_index - 1
    loop do
      break if before_index < 0
      before = array[before_index]
      break if before < current
      array[before_index + 1] = before
      before_index -= 1
    end
    array[before_index + 1] = current
  end
end
# rubocop:enable MethodLength

if $PROGRAM_NAME == __FILE__
  array = gets.chomp.split(' ').map(&:to_i)
  puts 'readable code:'
  puts InsertionSort.insertion_sort(array).join(' ')
  puts 'concise code:'
  insertion_sort!(array)
  puts array.join(' ')
end

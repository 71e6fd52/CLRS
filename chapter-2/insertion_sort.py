#!/usr/bin/env python

class InsertionSort:
    '''Sort by Insertion Sort

    Try to imagine you get a things
    move bigger things to right
    then put it to the right place
    '''
    def insertion_sort(array):
        for holding_index in range(1, len(array)):
            holdind = InsertionSort.__get(array, holding_index)
            place_to = InsertionSort.__right_shift(array, holdind, holding_index)
            InsertionSort.__put(array, place_to, holdind)

    def __get(array, index):
        return array[index]

    def __right_shift(array, holding, holding_index):
        right_shifting_index = holding_index - 1
        while True:
            if right_shifting_index < 0: break
            need_right_shift = array[right_shifting_index]
            if need_right_shift < holding: break # Get to the right place
            array[right_shifting_index + 1] = need_right_shift
            right_shifting_index -= 1
        return right_shifting_index + 1 # Correct - 1

    def __put(array, index, value):
        array[index] = value

def insertion_sort(array):
    for current_index in range(1, len(array)):
        current = array[current_index]
        before_index = current_index - 1
        while True:
            if before_index < 0: break
            before = array[before_index]
            if before < current: break
            array[before_index + 1] = before
            before_index -= 1
        array[before_index + 1] = current

if __name__ == '__main__':
    array1 = list(map(int, input().strip().split(' ')))
    array2 = array1[:]
    print('readable code:')
    InsertionSort.insertion_sort(array1)
    print(' '.join((str(x) for x in array1)))
    print('concise code:')
    insertion_sort(array2)
    print(' '.join((str(x) for x in array2)))

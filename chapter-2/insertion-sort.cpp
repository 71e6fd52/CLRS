#include <iostream>
#include <iterator>
#include <vector>

template<typename T>
void insertion_sort(T &array) {
  for(auto i = 0; i < array.size(); ++i) {
    auto current = array[i];
    auto j = i - 1;
    for(; j >= 0; --j) {
      if(array[j] < current) { break; }
      array[j + 1] = array[j];
    }
    array[j + 1] = current;
  }
}

#ifndef DISABLE_MAIN
int main([[maybe_unused]] int argc, [[maybe_unused]] const char *argv[])
{
  std::vector<int> v;
  std::copy(std::istream_iterator<int>(std::cin), std::istream_iterator<int>(), std::inserter(v, std::begin(v)));
  insertion_sort(v);
  std::copy(std::begin(v), std::end(v), std::ostream_iterator<int>(std::cout, " "));
  std::cout << std::endl;
}
#endif // DISABLE_MAIN

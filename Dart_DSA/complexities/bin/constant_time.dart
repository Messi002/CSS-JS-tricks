//The Big O notation for constant time is O(1)

void main(List<String> args) {
  // List<String> names = ['Foo', 'Bar', 'Baz'];
  List<int> numbers = [1, 3, 56, 450,66, 80, 99, 105, 68];
  // checkFirst(names);
  // printAll(names);
  // printMoreNames(names);
  bool returnedValue = checkIfValueExists(value: 68, numbers: numbers);
  print(returnedValue);
}

///For constant_time -> O(1)
void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first);
  } else {
    print('no names');
  }
}

///For Linear_time -> O(n)
void printAll(List<String> names) {
  for (var name in names) {
    print(name);
  }
}

///For Quadratic_time -> O(n^2)
///time proportional to the squared of the input data size
void printMoreNames(List<String> names) {
  for (var _ in names) {
    for (var name in names) {
      print(name);
    }
  }
}

///For Logarithmic_time -> O(log n)
///An algorithm that can repeatedly drop half of 
///the required comparisons will have logarithmic time complexity
bool checkIfValueExists({required int value, required List<int> numbers}) {
  numbers.sort();
  if (numbers.isEmpty) return false;
  
  int middleIndex = numbers.length ~/ 2;
  if (value >= numbers[middleIndex]) {
    for (var i = middleIndex; i < numbers.length; i++) {
      if (value == numbers[i]) return true;
    }
  }
  if (value <= numbers[middleIndex]) {
    for (var i = middleIndex; i >= 0; i--) {
      if (value == numbers[i]) return true;
    }
  }
  return false;
}


///For Quasilinear_time -> O(n log n)
///example is using the Dart's sort method

//For small data sets, time complexity is usually irrelevant. A quasilinear algorithm 
//can be slower than a quadratic algorithm.
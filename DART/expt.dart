extension subScript<T> on Iterable<T> {
 T operator [](index) => length > index ? elementAt(index) : null;
}


void main (){
  Iterable<int> numbers = [5];

  print("${numbers.single}");
}
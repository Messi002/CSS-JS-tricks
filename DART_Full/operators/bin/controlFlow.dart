//Control flow statements are used to change the flow of the application
//E.g. if, else ifs,

//traditional for loops(counting from start to end, counting from end to start,
//skipping some values by i +=2) using an array

//Modern for loop
//for(name in names) => print(name);

//Continue : meaning goes back to the execution of the for loop

//Break: Breaks completely out of the loop

//Grabbing an index from the modern for loop
void main(List<String> args) {
  final names = ['Paul, "Geroge', "Easy"];
  int counter = 0;
  for (var number in Iterable.generate(10)) {
    print(number);
  }

  //while loop
  while (counter < names.length) {
    print(names);
    counter++;
  }
  // or
  int countera = -1;
  while (++countera < names.length) {}

//D0-While executes first the body before checking on the condition
  do {
    print(names[counter++]);
  } while (counter < names.length);

  //
  const info = {
    'name' : 'John',
    'age' : 30,
    'height' : 1.8,
    'isMarried' : false,
    'address' : {
      'street' : 'main street',
      'city' : 'Yaounde',
      'country' : 'Cameroon'
    }
  };
}

//While loop evaluates just the condition and if that condition is met, then the
//loop is exited i.e. it evaluates first the condition then executes its body
//While can be read "as long as"

//Switch cases

void describe<T>(T value) {
  switch (T) {
  }
}

## Extension over a Class 
- extend an external code/property to the class 
- adding further meaning to the class 
- user can "include" or "exclude" these extensions 
- similar to how utility libraries work
- `adding logic to existing classes`

```dart
class Person {
  final String name;
  Person(this.name);
}

extension Run on Person {
  void run(){
    print('$name is running...');
  }
}
void test () {
  final meow = Person('hsm');
  print(meow.name); //hsm
  meow.run(); //hsm is running...
}
```

Another example over how to extend properties to classes -> 
```dart
class Person {
  final String firstName;
  final String lastName;

  Person(this.firstName, this.lastName); 
}

extension Fullname on Person {
  String get fullName => '$firstName $lastName';
}

void test () {
  final meow = Person('hsm',"gr8");
  print(meow.fullName); // hsm gr8
}
```

## Future 
- Data to be returned in the future, as its name suggests 
- Async function (not immediately)
- this is the way to work with `ASync functoins and requests`

```dart
Future<int> heavyFutureMultiplication (int a) {
  return Future.delayed(const Duration(seconds: 3), () => a);
  //delayed returned by 3 sec
} 
void test () async {
  int res = await heavyFutureMultiplication(10);
  print(res); // 10 [after 3 seconds]
}

```
**Whereas**, this below case isnt working asynchronously with the functions and finally returns a shell for the function which has been delayed (an _instance of the function_).. 

```dart
Future<int> heavyFutureMultiplication (int a) {
  return Future.delayed(const Duration(seconds: 3), () => a);
  //delayed returned by 3 sec
} 
void test ()  {
  final res = heavyFutureMultiplication(10);
  print(res); // Instance of 'Future<int>' [immediately]
}
```
## Streams 
- an asynchronous "pipe" of data 
- continous async stream of commands 
- like when I get the data from db and process it to get reallocated over the front
- `Either, completes completely or never completes all the tasks mentioned inside it (Async)` 

-> `await for` syntax is similar to await in Future 
```dart
Stream<String> getName() {
  return Stream.value("HSM");
}
void test () async {
    await for(final val in getName()){
    //await for a val from the getName stream
        print(val);
    } 
}
```

further, increasing functoinality for stream -> 
```dart
Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 1), (value) => 'HSM');
}

void test () async {
  await for(final val in getName()){
  print(val);
  }
//this stream will print the value 'HSM' every second periodically
}
```
## Generators 
- For genrating "iterables",marked with sync* and async*
- generating of list as the time passes, over the need of that iteration (itarable) 

```dart
Stream<Iterable<int>> getNumbers() async* {
  yield [1];
  yield [2];
  yield [3];
  yield [69];
}

Iterable<int> getNumb() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void test () async {
//  for(final value in getNumb()){
//   print(value);
//  }
print(getNumb());
}
```

## Generics 
- to avoid writing same code again and again 
- looking over the generics of the code and repectively streamlining it further over it

Imagine this senerio -> 
```dart
class Pair {
  final String val1;
  final String val2;

  Pair(this.val1, this.val2);

}
void test () {
  //whatt if a need to override with type of data I want to 
  //give out to Pair class?
}
```

I won't be making 2 seperate classes over the same properties, just having a diffrent Type of input. Here, we can make a **class of generic** -> 

```dart
class PairInt {
  final int val1;
  final int val2;

  PairInt(this.val1, this.val2);

}
class PairString {
  final String val1;
  final String val2;

  PairString(this.val1, this.val2);
}

class Pair <A, B>{ // this is a generic (to look over what kind of input we have here)
  final A val1;
  final B val2;

  Pair(this.val1, this.val2);
}
void test () {
  final names = Pair("HSM", "GR8");
  
}
```


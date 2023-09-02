## what are Enumerations? 
- Named list of related terms 
- making a string problamatically, have indentity to themselves ( list of things("string") which have a meaning for themselves)
- categories related items under an array for easy access of properties
```dart
enum PersonProperties {
  firstName, lastName, age
}
void test () {
  print(PersonProperties.firstName); // PersonProperties.firstName
  print(PersonProperties.firstName.name); // firstName
}
```

how to look over different types of strings( things ) -> 
```dart
enum AnimalType {
  cat, dog, rabbit, bunny
}
void test (AnimalType animalType) {
  print(animalType); //animalType.cat
}

test(AnimalType.cat);
```
## what is a _Switch_ Statement? 
- to avoid if else iterations multiple times

```dart
enum AnimalType {
  cat, dog, bunny
}
void test (AnimalType animalType) {
  switch(animalType) {
    case AnimalType.bunny:
    print("bunny here...");
    break;
    case AnimalType.cat:
    print("cat here...");
    break;
    case AnimalType.dog:
    print("dog here...");
  }
}

test(AnimalType.cat); // cat here...
```

## What are Classes? 

- grouping of various functoinalities into one packageable piece of data
- we can group the characteristics to a single package for better control and understanding of the **object** (**instance over the class**)

```dart
class Person {
    void run () {
        print("running...");
    }

    void breathe () {
        print("breathing");
    }
}

void test () {
  //instance of the class (object)
  final person = Person();
  person.run(); //running...
}
```
## what are constructors?

- special logic in a class where it **constructs/initailizes** the class instance 
- having a default value to it, preventing ghosting of attributes when they aren't mentioned
- `this` -> current instance of the class (dont use it inside the methods until its a must _printName_ is the example) 
```dart
class Person {

  final String name;
  
  Person(this.name);
  //pass the argument to it ( constructor )

  void printName() {
    print(name);
  }
}

void test () {
  final person = Person("hsm");
  print(person.name); //hsm
  person.run();
}
```

## what are Inheritance?

- inherit properties/functoinality from the parent class and add further properties to itself
- like a parent to a child 
- reduces repeatition of code 

we can inherit classes as ->

### what are Subclassing ? 

- subset of the class 
- group of properties in a class which have a seperate co-joined meaning to them 

```dart
class Person extends Living {}
```

## what is a Abstract class ? 

```dart
abstract class Person {

  final String name;
  
  Person(this.name);
  //pass the argument to it ( constructor )

  void printName() {
    print(name);
  }
}

class Hsm extends Person {}
```
- just like a normal class that can't be instantiated 
- useful in defining interfaces and some implementation 
- other class the use the properties of that class and build further over them ( defining the methods the abstract class have) 
- they can contain logic too. 

## what is a Factory Constructor? 

- make constructor of classes using convenience function
- make a default value to it. 
- if we use the same properties repeatitively, we can defin them in the class & make a instance with that values w/o repeatative addition of value by user/another function

```dart
class Cat {
    final String name; 
    Cat(this.name);
    factory Cat.fluffBall(){
        return Cat("fluff");
    }

    //OR (use the above one mostly)

    factory Cat.fluffBall(): name = "fluff"; 
}

void test() {
    final fluff = Cat.fluffBall();
    print(fluff.name); //fluff
}
```
TODO: look over it further 


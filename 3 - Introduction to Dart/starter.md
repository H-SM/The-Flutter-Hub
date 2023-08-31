## making a demo playground for my application 

we will create our flutter sample project where we can test our dart code. we will make and build our projects here (we can even use up our dartpad to further test out code)... but that's a online service and will be difficult to manage the entire application code

refer the the learning project folder for further knowledge 


### making a new Flutter Project

similar to our good old react it has a nearly same structure to create a new application for flutter. Run the following command in cmd 

```bash 
E:\Project\The-Flutter-Hub>flutter create <application-name-here>
```

After making the application for our dear learning we will go to that project file and get to IDE for further editing our project 

```bash 
cd <application-name-here> 
code .
```

Next we need to open our andriod simulator via going to preferences in vscode `ctrl+sft+P` and execute this (have the android simulator to execute the command)

```bash 
>Flutter: Select Device
```

we will have our emulator up for our application... and we will start our journey in "main.dart" file

after having the emulator and our code up, run the code with `run without debugging` this will run the flutter framework over the emulator

### what are 'keywords'? 

words reserved for a specific task for the project/ language, which have a lexical meaning to themselves.. 

wanna know more over `dart` keywords -> [click here](https://dart.dev/guides/language/language-tour#keywords)

`the language is made out of these special words called keywords - make understand what we want from it`

## What are 'DataTypes'? 

type of our value - what type of data we will be using in the current sequence/function.. even a list is a datatype (more of a nationality for the data)

`specific name assign to a data that is bound to be of a specific type`

wanna know more on `dart` datatypes -> [click here](https://api.dart.dev/stable/3.1.0/dart-core/dart-core-library.html)

## what are 'constants' ? 

values who's value can't be changed 

```dart
int a = 10;
// ( here 10 is a constant)

String shakespeareQuote = "All the world's a stage, ...";
// this is a integer TYPE data assigning to 'shakespeareQuote' variable with a constant value of "All the world's a stage, ..."

const age = 27;
//telling dart "age" is need to be set constant 
```

there are **2 Types** of time (both have same constant value) -> 
- _compile-time_ 
- _run-time_ 

**variable** -> to hold data in it
**Function** -> hold the logic in it 

little look over function -> 
```dart
String nameAdder(String n1, String n2){
  return n1+" "+n2;
}
//string formatation
String nameAdderFrmt(String n1, String n2) {
  return '$n1 $n2';
}
```

Short-hand notation ( when the functoin is doesn' have much functoinality) `only one statement` ->
```dart
String nameAdder2(String n1, String n2) =>
  '$n1 $n2';
```


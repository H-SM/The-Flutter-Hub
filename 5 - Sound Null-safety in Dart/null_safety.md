## What is Null-safety (ow, what is NULL value)?

- absense of a value 
- `nothing` 
- a keyword 

docs here -> [click here](https://dart.dev/null-safety)

null-safety -> not `manually checking for a null value`, it will be checked automatically (not the case in old dart versions, and thus having a "Migrating an existing app" in the docs ove rhow to migrate an app into null-safety) 

```dart
  String? name = null;
  print(name);
  //null
  name = "HSM";
  print(name);
  //HSM
```
here we are **marking** the string type to be **nullable**. With the use of the **question mark** after the data type we can perform such an action. 

```dart
  List<String>? names = ["HSM","Sidd"];

  names = null; 
  //valid as the list is being set nullable,
  // but this will give an error here -> ["HSM","Sidd",null]

  List<String?> names = ["HSM","Sidd",null];
  //valid as the content of the list(string) is being set nullable
  // WE CAN EVEN DO BOTH
  print(names);
```

### Cherry picking non-null values 

- use the `??` operator
- give me the values which aren't null 

```dart
//this is the traditional if else if way 
  const String? name = null;
  const String? namesec = "HSM";
  const String? namelast = "SM";

  if(name != null)
  print(name);
  else if(namesec != null)
  print(namesec);
  else if (namelast != null)
  print(namelast);

//and this is the cherry picking way
  const firstNull = name ?? namesec ?? namelast ?? "all null";
  print(firstNull);

//OR 

void test (String? name, String? namesec, String? namelast) {
  final firstNull = name ?? namesec ?? namelast ?? "all null";
  print(firstNull);
}
```

### Null-aware assignment operator 

- use `??=` in this case
- tries to resolve a variable to make sure thats not null
- if the variable you got is null try this instead

```dart
void test (String? name, String? namesec, String? namelast) {
  String? namer = name;
  namer ??= namelast;
  print(namer); 
}

test(null,"h","HSM");// HSM

test("hsMM","h","HSM");// hsMM
```
### Conditonal Invocation

- we use `?.` here
- `.` -> access properties/functions 
- how to access properties of a null then 

```dart
List <String>? names = null;
  final numberOfNames =  names.length; // this here is unconditional to NULL & raises an error
  print(numberOfNames);

  final numberOfNames =  names?.length;
  print(numberOfNames); // null 

  //to prevent null
  final numberOfNames =  names?.length ?? 0;
  /* 
  The above one line of code removes this entire checking -> 
  int numberOfNames = 0;
  if(names != null){ // TYPE PROMOTION 
    numberOfNames = names.length;
  }
  */

  //similar case here -> 
  names?.add("hsm");
  //TODO:still need to look over why this isn't working ...
```

wanna have look over the docs -> [click here](https://dart.dev/null-safety/understanding-null-safety)
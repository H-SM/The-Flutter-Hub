## What are our Data control Statements & collection ? 

### If-and-else 

braching out the code for diffrent senerios over the conditions mentioned over them inorder to create validated results based on the given conditions 

we may look over a conditional opartion as -> 
```dart
 final name = "HSM";
 if (name == "HSM") {
  print("yes HSM!");
 }else{
  print("who are you? where is my owner!! :()");
 }
```

single lined non-paranthesis if-else is also there in dart -> 
```dart
final name = "HSM";
 if (name == "HSM") print("yes HSM!");
 else print("who are you? where is my owner!! :()");
```

## Operators in Dart

|**operator**|**task**| 
| --- | --- | 
| = | _assignment_ |
| / | _divison_ |
| * | _multiply_ |
| + | _add_ |
| - | _subtract_ |
| == | _equals_ |
| -- | _decrement_ |
| -- | _decrement_ |

for strings if we apply any of the operation on the strings it basically applies that operation to it like `only * works on mulitplication` -> 
```dart
 final name = "HSM ";
 final bigName = name * 100;
 print(bigName);
 /*
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM HSM 
HSM
*/

```

## List in Dart 

similar to other programming languages, there are a `collection of list`. These are also refered as `List of homogeneous "things"`. here's the way to represent list in Dart -> 
```dart
 final arr = ['HSM','IS','GR8'];
 final name = arr[1];
 print(name);
```

and a few functions over our list -> 

- **length of list** 
```dart
 final lngth = arr.length;
 print(lngth);
```
- **adding element to the list** 
```dart
var arr = ['HSM','IS','GR8'];
  final name = arr[0];
  print(name);

  final lngth = arr.length;
  print(lngth);
  arr.add("!!!");

  print(arr);
```
## sets in Dart 

similar to other programming languages, there are a `collection of values which are unique`. These are also refered as `List of unique "things"`. here's the way to represent set in Dart -> 

```dart
  const arr = {'HSM','IS','GR8'};

  const arr = {'HSM','HSM','IS','GR8'};
  //two elements in a constant set can't be equal

```

- adding `data to a set`
```dart
  var arr = {'HSM','IS','GR8'};
  arr.add("!!!");
  arr.add("THIS");
  arr.add("IS");
  arr.add("ertesprojekt");
  print(arr);
  // {HSM, IS, GR8, !!!, THIS, ertesprojekt}
```
**NOTE** : _The added "IS" isnt added to the list as there already was a similar element in it_

## Maps in Dart 

similar to other programming languages, there are a `collection of {key,value} pairs of information`. here's the way to represent set in Dart -> 
```dart
   const mp = {'name' : 'HSM','Abbri':'IS','context':'GR8'};
  
  print(mp);
  //{name: HSM, Abbri: IS, context: GR8}

  mp['name']= 'HSSSM';
  print(mp);
  //{name: HSSSM, Abbri: IS, context: GR8}
```

more on maps -> [click here](https://api.dart.dev/stable/dart-core/Map-class.html)

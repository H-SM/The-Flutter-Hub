## Making Basic Regsitersation Page

We will create up a Basic Registeration Page for the user to login to and access their data after the checkng if their credentials. This floater application contacts with the Firebase and gets the user's info over it.

### So let's start up (this is the basic workflow over this chapter) ->

- Removing comments from main.dart
- we can do a hot reload by -> `ctrl + S` (just basic stuff)
- If changes are heavily drastic and BIG then -> hot Restart the application is the option (we can do this from the drat's menu)
- State & stateful(state is the state of the application & stateful are the widgets/components under the effect of this state[or any]) functions and attributes.
- we can even have stateless widgets/functions which are nearly alike default functions (immumatable variables are here [not having a state])
- -> `stl`-> emmet for a stateful widget/compo
- `Scaffold` -> we need this widget for the HomePage/component to interact with Android and reach to favourable results (eg -> if we need the navbar/notification bar for the page to be dark, scaffold allows us to traverse with our application)

## Basic Application

Looking over Scaffold in the application could be done with such an example below. We will be having a blue color Navbar/appBar over the top of the application ->

```dart
void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.orange.shade300);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
        //this is the overlaying text on the appbar
        ),
    );
  }
```

If we wish to visit the source code we can look over the library of flutter. THe direct routing to our components /widgets are here -> `flutter/lib/src/material`

## Registeration Button

After creating our Scaffold, we will create a login button now.Through dart, ww will make a "Register" type button which is at the **center** to **register**. This could be achieved as ->

```dart
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
        ),
        body: Center(
          child: TextButton(onPressed: () async {

          },child:const Text("Register NOW!")),
        ),
    );
```

So now we need to have a backend request over this button on its action (onPressed)... far this we need to fetch user info from the screen, make a backend request to firebase and asyncronously check over the data, and finally inbiunding the user with there info after checking for their login credentails.

for looking over furhter into how to do this task, have a look over this doc -> [click here](https://firebase.flutter.dev/docs/auth/usage/#other-sign-in-methods)

these are the avaliable signin options which firebase provides ->
`Firebase also supports authenticating with external provides. To learn more, view the documentation for your authentication method`

- Apple Sign-In.
- Facebook Sign-In.
- Twitter Sign-In.
- Google Sign-In.
- Phone Number Sign-In.

(we will use `email and password signin` for this application)

## Column with 2 text feilds (inputs)

Now we will add username and password text feilds to our codebase, representing our login over hte info which we have.

- making `TextFeild` for inputs (will make them stateful,for the user's info).
- Turning HomePage to `StatefulWidget`.
- mention the 2 textfeild in the `State of HomePage` or in the function `_HomePageState` - which is where we define the state of the page/application
  This is done by ->
  ```dart
    late final TextEditingController _password;
  ```
  where ->
  late - promise to asssign a value to it before it is used.(like a contract)

```when we create our State (StateFul widget creation) we will get to states packed with it ->
- initState -> called automatically when it creates our homepage ( ability to initialize our late variables here)
- disposeState -> when our functoin dies, we need to dispose off the memory for the function
```

Basic structure of our initState ->

```dart
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
```

and the basic structure of the disposeState ->

```dart
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
```

**_ALL THE ABOVE THINGS TOGETHER COMPLETES THE PACKAGE FOR A STATEFUL COMPONENT_**

our final state for our application with 2 input feilds will be like ->

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.orange.shade300);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
        ),
        body:
          Column(
            children: [
              TextField(),
              TextField(),
              TextButton(
                onPressed: () async {

                },
                child:const Text("Register NOW!"),
              ),
            ],
          ),
    );
  }
}
```

And finally we connect the stateful textfeilds variable with the feilds in our form ->

```dart
  children: [
              TextField(
                controller: _email,
              ),
              TextField(
                controller: _password,
              ),
              TextButton(
                onPressed: () async {

                },
                child:const Text("Register NOW!"),
              ),
            ],
```

## Hint on text feilds

we have made the textfeilds and connected it to the state by now.BUT, how will the user know what feild to fill in which part of the form?? we need to provide `HINT` for our user to fill out the form feilds.`Its nearly like placeholder in HyperText`. This could be done as->

```dart
children: [
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                  hintText: 'Enter your email here'
                ),
              ),
              TextField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here'
                ),
              ),
              TextButton(
                onPressed: () async {

                },
                child:const Text("Register NOW!"),
              ),
            ],
```

## Authenticating with firebase

GREAT, we will have a nice form for the user to submit into by now. Let's move forward to authenticating the user with their info and check for their credibility over the application.
we firstly need to import `firebase-auth` for authenticating user's info.

```dart
import 'package:firebase_auth/firebase_auth.dart
```

Now we need the `CREATE THE USER`, the anoynomous shell for the user to connect with their info and get the state for their data.

```dart
body:
          Column(
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email here'
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Enter your password here',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  final userCredential = FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password
                  );// this returns UserCredentials

                  print(userCredential);

                },
                child:const Text("Register NOW!"),
              ),
            ],
          ),
```

BUT BUT BUT, this isn't it yet... we need to initialize the firebase configurations to the instance we made above. It's kinda silly of telling we will do a task and not tell the intended way/form for it.

```bash
E/flutter (13149): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: [core/no-app] No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
```

what we need to do is to register `needs Firebase initailization before other calls to Firebase`. -> `Firebase.initializeApp`

Default [FirebaseOptions] for use with your Firebase apps.Example:

```dart
import 'firebase_options.dart';
 // ...
await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
);
```

The next error we get (after a vaild net connection for the device) -> [This is because we haven't told yet to the firebase that we will be taking advantage of Email and Password Sign-in comination here (out of the 7 options)]

```bash
E/RecaptchaCallWrapper(17517): Initial task failed for action RecaptchaAction(action=signUpPassword)with exception - An internal error has occurred. [ CONFIGURATION_NOT_FOUND ]
E/flutter (17517): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: [firebase_auth/unknown] An internal error has occurred. [ CONFIGURATION_NOT_FOUND ]
```

to fix this follow these steps ->

- Go to firebase console, Go to `Authentication` for the project.
- click `Get Started`
- in `sign-in methods` click `Email/Password`.

and here we will have back the user's credentials. (IT WORKED!!) ->

```bash
I/FirebaseAuth(17517): Creating user with qwewe@gmail.com with empty reCAPTCHA token
2
W/System  (17517): Ignoring header X-Firebase-Locale because its value was null.
D/FirebaseAuth(17517): Notifying id token listeners about user ( RAj6QJGJOFd1jkB3UHr0kPJOqFi2 ).
D/FirebaseAuth(17517): Notifying auth state listeners about user ( RAj6QJGJOFd1jkB3UHr0kPJOqFi2 ).
I/flutter (17517): UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: true, profile: {}, providerId: null, username: null, authorizationCode: null), credential: null, user: User(displayName: null, email: qwewe@gmail.com, isEmailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2023-09-07 14:23:06.028Z, lastSignInTime: 2023-09-07 14:23:06.028Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: null, email: qwewe@gmail.com, phoneNumber: null, photoURL: null, providerId: password, uid: qwewe@gmail.com)], refreshToken: null, tenantId: null, uid: RAj6QJGJOFd1jkB3UHr0kPJOqFi2))
```

#### But what if we have mulitple buttons??

we wont be making a new binding as such for each button. right! so we enable `WidgetBinding` in flutter. Binding down these buttons to the relevent task in hand. docs for it -> [click here](https://docs.flutter.dev/recources/architectural-overview#architectural-layers)

```dart
//7
void main() {
  WidgetsFlutterBinding.ensureInitialized(); // <<<
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
}
```

now how to stop user to do something while an action is underway( eg -> not opening in the page, when the firebase initilization has not been made to the server [more like backend]).
we modified our body from its usual child syntax and made a `Future` & `Builder` parameterized `FutureBuilder` ->

```dart
 body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),//initailization transfered here
            builder: (context, snapshot) {
              return Column(
              children: [
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email here'
                  ),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password here',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    //no await initialization here now
                    final userCredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password
                    );// this returns UserCredentials

                    print(userCredential);
                  },
                  child:const Text("Register NOW!"),
                ),
              ],
            );
            },
          ),
```

## Loading the screen for backend calls

Here,(above snippet) `snapshot` parameter -> is the `STATE of the object` (result of the future).
looking over this we will look over when to set the loading and shut down the loading on completion of the snapshot data( usre data) state. The general format for it is ->

```dart
builder: (context, snapshot) {
  switch (snapshot.connectionState){
    case ConnectionState.none:
       // TODO: Handle this case.
    case ConnectionState.waiting:
      // TODO: Handle this case.
    case ConnectionState.active:
      // TODO: Handle this case.
    case ConnectionState.done:
      // TODO: Handle this case.
      return Column( //contd... context(if done)
   }
```

how we did it->

```dart
  builder: (context, snapshot) {
   switch (snapshot.connectionState) {
    case ConnectionState.done:
      return Column( //contd... context(if done)
      );
     default:
      return Text("Loading...");
   }
  };
```

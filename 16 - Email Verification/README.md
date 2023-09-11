- Mkaing a Email verificationview Pushing PageRoute on no emailverification on the user's info in the backend (just to check over wheather it's actually the user's email or not)
```dart
builder: (context, snapshot) {
switch (snapshot.connectionState) {
  case ConnectionState.done:
    //getting current user
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified ?? false) {
      print("Verified user");
    } else {
      print("Unverified user");
      //pushing the verifyEmailVeiw over the HomePage
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const VerifyEmailVeiw()));
      // return const VerifyEmailVeiw();
    }
    return const Text("Done");
  default:
    return const Text("Loading...");
```

BUT, it's not a **Good idea to push routes in a future builder**, like we did here, what if it doesn't loads?? (`this will be fixed up in the future`, we have a low end code rn, and all the routes are accesable readily by the endpoint)

The bash error here -> 
```bash 
/flutter (21276): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: 'package:flutter/src/widgets/navigator.dart': Failed assertion: line 2924 pos 18: '!navigator._debugLocked': is not true.
E/flutter (21276): #0      _AssertionError._doThrowNew (dart:core-patch/errors_patch.dart:51:61)
E/flutter (21276): #1      _AssertionError._throwNew (dart:core-patch/errors_patch.dart:40:5)
E/flutter (21276): #2      _RouteEntry.handlePush.<anonymous closure> (package:flutter/src/widgets/navigator.dart:2924:18)
E/flutter (21276): #3      TickerFuture.whenCompleteOrCancel.thunk (package:flutter/src/scheduler/ticker.dart:420:15)
E/flutter (21276): <asynchronous suspension>
E/flutter (21276): #4      TickerFuture.whenCompleteOrCancel.thunk (package:flutter/src/scheduler/ticker.dart:419:5)
E/flutter (21276): <asynchronous suspension>
```

- Further on here is the comeplete emial verification View which is pushed over the HomePage -> 
```dart
class VerifyEmailVeiw extends StatefulWidget {
  const VerifyEmailVeiw({super.key});

  @override
  State<VerifyEmailVeiw> createState() => _VerifyEmailVeiwState();
}

class _VerifyEmailVeiwState extends State<VerifyEmailVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Column(children: [
        const Text("Please Verify your Email Address:"),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          },
          child: const Text('Send Email Verification'),
        )
      ]),
    );
  }
}
```

- Looking over the **Exception** we encountered earlier, there isnt a great way to push a route as we did before (the exception came due to the Emaio verification veiw returning a Scaffold, w/o any function calling for a return for the same)... for this we refactor the way we push our Email verfication Scaffold. we wonn give out Scaffold, as that intersect up with the SCaffold of the homepage, and raises the error. 
 
```dart
class _VerifyEmailVeiwState extends State<VerifyEmailVeiw> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Please Verify your Email Address:"),
      TextButton(
        onPressed: () async {
          final user = FirebaseAuth.instance.currentUser;
          await user?.sendEmailVerification();
        },
        child: const Text('Send Email Verification'),
      )
    ]);
  }
}
```

AND 

```dart
case ConnectionState.done:
  //getting current user
  final user = FirebaseAuth.instance.currentUser;
  print(user);
  if (user?.emailVerified ?? false) {
    print("Verified user");
    return const Text("Done");
  } else {
    print("Unverified user");
    //pushing the verifyEmailVeiw over the HomePage
    return const VerifyEmailVeiw();
  }
// return const LoginView();
default:
```

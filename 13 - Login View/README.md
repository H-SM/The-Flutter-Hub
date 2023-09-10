## Refcatoring the Registeration view/Page

### Create a stateful RegisterView widget

- base of our register view

```dart
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

- We renamed our HomePage to our login view & the only change is to check the credentails over them by using `signInWithEmailAndPassword` as ->

```dart
  final userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: email,
          password: password); // this returns UserCredentials
  print(userCredential);
```

Now we get the login view to main dart file to use it ->

```dart
import 'package:inotes/views/login_view.dart';
```

Now user can login to their account ->

```bash
I/flutter (19410): UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: false, profile: {}, providerId: null, username: null, authorizationCode: null), credential: null, user: User(displayName: null, email: qwewe@gmail.com, isEmailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2023-09-07 14:23:06.028Z, lastSignInTime: 2023-09-10 10:34:31.112Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: null, email: qwewe@gmail.com, phoneNumber: null, photoURL: null, providerId: password, uid: qwewe@gmail.com)], refreshToken: null, tenantId: null, uid: RAj6QJGJOFd1jkB3UHr0kPJOqFi2))
```

If the info is wrong, we will get the result over that issue ->

```bash
E/flutter (19410): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: [firebase_auth/wrong-password] The password is invalid or the user does not have a password.
```

looking over the exceptions while calling out the Login ( like -> user-not-found,wrong-password...) ->

```dart
try {
   final userCredential = await FirebaseAuth.instance
       .signInWithEmailAndPassword(
           email: email,
           password:
               password); // this returns UserCredentials
   print(userCredential);
 } catch (e) {
   print("exception occuried");
   print(e.runtimeType); //FirebaseAuthException
 }
```

To get expection specific catch ( like Firebase related auth errors here) -> 
```dart
 try {
  final userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: email,
          password:
              password); // this returns UserCredentials
  print(userCredential);
} on FirebaseAuthException catch (e) {
  print("exception occuried");
  print(e.code); //user-not-found
}
```

- we need to make Register View after
`Nearly doing the same things of exception handling in Registeration View`


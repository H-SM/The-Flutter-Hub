### TODO list in this Chapter -> 
- Making single initialization for both login and registeration veiws
- Bring registeration view

## Bring registeration view
- move and make `views/register_view.dart`.

## Making single initialization for both login and registeration views
- Dedicated HomePage stateless widget (needs to do the initialization)
- Logic to look over which view to see (preventing mulitple initialization of application (Firebase here))
```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.orange.shade300);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Text("Done");
              default:
                return const Text("Loading...");
            }
          }),
    );
  }
}
```

### Looking over Non-null and verfied user 
- Looking over the properties of user. 
- If the user is already logged in the application from the device, the login info will be saved up in the cache, we will use that info to cross-check whether user is already logged in, if so redirect it to the Home Page w/o any login/registeration views.
- `And also Email must be verified`, which we will look over in this section. 
(we will do the redirection and verification in the `Chapter 16`)

here's how we detect verfication in the HomePage -> 
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
      }
      return const Text("Done");
    default:
      return const Text("Loading...");
  }
}),
```

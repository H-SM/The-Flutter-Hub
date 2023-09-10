import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inotes/firebase_options.dart';
// import 'package:inotes/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

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
    );
  }
}

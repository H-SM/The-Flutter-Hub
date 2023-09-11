import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inotes/firebase_options.dart';
import 'package:inotes/views/login_view.dart';
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
                return const Text("Loading...");
            }
          }),
    );
  }
}

class VerifyEmailVeiw extends StatefulWidget {
  const VerifyEmailVeiw({super.key});

  @override
  State<VerifyEmailVeiw> createState() => _VerifyEmailVeiwState();
}

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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
      appBar: AppBar(title: const Text('Register')),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  children: [
                    TextField(
                      controller: _email,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Enter your email here'),
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

                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email,
                                password:
                                    password); // this returns UserCredentials

                        print(userCredential);
                      },
                      child: const Text("Register NOW!"),
                    ),
                  ],
                );
              default:
                return Text("Loading...");
            }
          }),
    );
  }
}


/// Flutter code sample for [Scaffold].

// void main() => runApp(const ScaffoldExampleApp());

// class ScaffoldExampleApp extends StatelessWidget {
//   const ScaffoldExampleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ScaffoldExample(),
//     );
//   }
// }

// class ScaffoldExample extends StatefulWidget {
//   const ScaffoldExample({super.key});

//   @override
//   State<ScaffoldExample> createState() => _ScaffoldExampleState();
// }

// class _ScaffoldExampleState extends State<ScaffoldExample> {
//   int _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sample Code'),
//       ),
//       body: Center(child: Text('You have pressed the button $_count times.')),
//       backgroundColor: Colors.blueGrey.shade200,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => setState(() => _count++),
//         tooltip: 'Increment Counter',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

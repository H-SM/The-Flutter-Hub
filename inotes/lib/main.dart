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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.orange.shade300);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register')
        ),
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

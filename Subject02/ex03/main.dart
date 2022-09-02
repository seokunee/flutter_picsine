import 'package:flutter/material.dart';
import 'package:flutter_piscine/bmi_input_page.dart';
// import 'package:flutter_piscine/bmi_output_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BmiCalculator();
  }
}

// class BmiResult extends StatelessWidget {
//   const BmiResult({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Second Route"),
//       ),
//       body: Center(
//           child: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Go to first page'),
//           ),
//         ],
//       )),
//     );
//   }
// }

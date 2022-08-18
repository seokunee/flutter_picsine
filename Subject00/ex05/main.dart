import 'package:flutter/material.dart';
import 'package:flutter_piscine/custum_widget/blur_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'poketmonster',
      home: PoketmonDetail(),
    );
  }
}

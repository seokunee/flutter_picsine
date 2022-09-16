import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_piscine/custum_widget/movie_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'limitless',
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Movie Poter',
          style: GoogleFonts.fruktur(),
        ),
      ),
      body: MoviePage(),
    );
  }
}

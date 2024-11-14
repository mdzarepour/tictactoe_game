import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        //appbar theme =>
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        //text theme =>
        textTheme: TextTheme(
          headlineLarge: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 70,
            color: Colors.deepPurple,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 70,
            color: Colors.blueGrey,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

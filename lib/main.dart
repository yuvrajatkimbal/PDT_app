import 'package:downtime_frontend/view/Screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.geologicaTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   // Add other routes here
      // },
    );
  }
}

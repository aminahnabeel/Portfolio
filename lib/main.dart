import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

/// Root application widget — sets up global theme with Kanit font,
/// dark colour scheme, and launches HomeScreen.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aminah Nabeel — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000),
        colorScheme: const ColorScheme.dark(
          primary:   Color(0xFF9747FF),
          secondary: Color(0xFFFE814C),
          surface:   Color(0xFF000000),
        ),
        textTheme: GoogleFonts.kanitTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

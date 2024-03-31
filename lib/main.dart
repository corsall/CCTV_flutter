import 'package:cctv/pages/auth_page.dart';
import 'package:cctv/pages/home_page.dart';
import 'package:cctv/pages/recordings_page.dart';
import 'package:cctv/pages/screenshots_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
  }

  void checkLoginStatus() {
    bool isLoggedIn = true;
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black87,
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          bodyLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.black87,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black87,
        ),
      ),
      home: _isLoggedIn ? const MyHomePage() : const AuthPage(),
      routes: {
        '/home': (context) => const MyHomePage(),
        '/screenshots': (context) => const ScreenshotsPage(),
        '/recordings': (context) => const RecordingsPage(),
      },
    );
  }
}

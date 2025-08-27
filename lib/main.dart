import 'package:flutter/material.dart';
import 'package:routetracking_flutter/data/notifiers.dart';
import 'package:routetracking_flutter/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (BuildContext context, dynamic isDarkMode, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF659bad),
              brightness: isDarkMode ? Brightness.light : Brightness.dark,
            ),
          ),
          home: LoginPage(),
        );
      },
    );
  }
}

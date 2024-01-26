import 'package:edmas/presentation/screens/login_screen.dart';
import 'package:edmas/utills/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EDMAS',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const LoginScreen(),
    );
  }
}
//To run in Web: flutter run -d web-server --web-renderer html

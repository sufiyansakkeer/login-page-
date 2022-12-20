import 'package:flutter/material.dart';

import 'package:login_page/splash.dart';

const sharedKeyValue = 'UserLoggedIn';
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}

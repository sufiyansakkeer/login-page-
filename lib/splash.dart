import 'package:flutter/material.dart';

import 'package:login_page/login_screen.dart';
import 'package:login_page/main.dart';
import 'package:login_page/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    userLogged();
    // gotoLogin();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('YOu Look So Good'),
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((ctx) {
      return const LoginPage();
    })));
  }

  Future<void> userLogged() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userloggedin = sharedprefs.getBool(sharedKeyValue);
    if (userloggedin == null || userloggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
        return const HomePage();
      })));
    }
  }
}

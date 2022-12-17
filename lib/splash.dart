import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/ScreenOne.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screentwo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    UserLogged();
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
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((ctx) {
      return const LoginPage();
    })));
  }

  Future<void> UserLogged() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userloggedin = _sharedprefs.getBool(Shared_Key_value);
    if (_userloggedin == null || _userloggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
        return HomePage();
      })));
    }
  }
}

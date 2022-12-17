import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/ScreenOne.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home '),
        actions: [
          IconButton(
              onPressed: (() {
                signout(context);
              }),
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Text('congrats ,this is your page'),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();
    return Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) {
      return LoginPage();
    })), (route) => false);
  }
}

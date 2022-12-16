import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameofuser = TextEditingController();
  TextEditingController _passwordofuser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text('user name'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _nameofuser,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _passwordofuser,
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text('login'),
                onPressed: () {},
              )),
        ]),
      ),
    );
  }
}

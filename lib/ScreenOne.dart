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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name',
                ),
                controller: _nameofuser,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.all(20),
              child: TextFormField(
                obscureText: true,
                controller: _passwordofuser,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomRight,
                // padding: const EdgeInsets.all(0),
                child: ElevatedButton(
                  child: const Text('login'),
                  onPressed: () {
                    checking(context);
                  },
                )),
          ]),
        ),
      ),
    );
  }

  void checking(BuildContext ctx) {
    final _username = _nameofuser.text;
    final _password = _passwordofuser.text;

    if (_username == _password) {
      //go to home
    } else {
      final _errormessage = 'username and passsword does not match';
      //snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(_errormessage),
      ));

      //alert dialogue

      showDialog(
          context: ctx,
          builder: (context1) {
            return AlertDialog(
              title: Text('dude ..'),
              content: Text(_errormessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context1).pop();
                    },
                    child: Text('Got It'))
              ],
            );
          });
    }
  }
}

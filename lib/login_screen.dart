import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameofuser = TextEditingController();
  final TextEditingController _passwordofuser = TextEditingController();

  bool isdatamatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView(children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                // padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'User Name',
                  ),
                  validator: (value) {
                    // if (isdatamatched) {
                    //   return null;
                    // } else {
                    //   return 'invalid username';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else {
                      return null;
                    }
                  },
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
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.blueGrey,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    // if (isdatamatched) {
                    //   return null;
                    // } else {
                    //   return 'password is incorrect';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Visibility(
                  //   visible: !isdatamatched,
                  //   child: Container(
                  //     child: Text(
                  //       'user name and password does not match',
                  //       style: TextStyle(color: Colors.red),
                  //     ),
                  //   ),
                  // ),
                  Container(
                      alignment: Alignment.bottomRight,
                      // padding: const EdgeInsets.all(0),
                      child: ElevatedButton(
                        child: const Text('login'),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            checking(context);
                          } else {}
                        },
                      )),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void checking(BuildContext ctx) async {
    const username = 'admin';
    // final _username = _nameofuser.text;
    // final _password = _passwordofuser.text;
    const password = 'password';

    if (username == _nameofuser.text && password == _passwordofuser.text) {
      //go to home
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool(sharedKeyValue, true);

      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return const HomePage();
        })));
      });
    } else {
      const errormessage = 'username and password does not match';
      // snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(errormessage),
      ));

      //alert dialogue

      // showDialog(
      //     context: ctx,
      //     builder: (context1) {
      //       return AlertDialog(
      //         title: Text('dude ..'),
      //         content: Text(_errormessage),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(context1).pop();
      //               },
      //               child: Text('Got It'))
      //         ],
      //       );
      //     });

      //showing text
      setState(() {
        isdatamatched = false;
      });
    }
  }
}

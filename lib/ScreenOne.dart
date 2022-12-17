import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screentwo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameofuser = TextEditingController();
  TextEditingController _passwordofuser = TextEditingController();

  bool isdatamatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
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
    final _username = 'admin';
    // final _username = _nameofuser.text;
    // final _password = _passwordofuser.text;
    final _password = 'password';

    if (_username == _nameofuser.text && _password == _passwordofuser.text) {
      //go to home
      final _sharedprefs = await SharedPreferences.getInstance();
      _sharedprefs.setBool(Shared_Key_value, true);

      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return HomePage();
        })));
      });
    } else {
      final _errormessage = 'username and passsword does not match';
      // snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(_errormessage),
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

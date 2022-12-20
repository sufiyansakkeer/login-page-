import 'package:flutter/material.dart';

import 'package:login_page/login_screen.dart';
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
        title: const Text('Home '),
        actions: [
          IconButton(
              onPressed: (() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text(
                          'alert! ',
                          style: TextStyle(color: Colors.red),
                        ),
                        content: const Text('do you really want to exit.'),
                        actions: [
                          TextButton(
                              onPressed: (() {
                                signout(context);
                              }),
                              child: const Text(
                                'yes',
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: (() {
                                popoutfuction(context);
                              }),
                              child: const Text('no',
                                  style: TextStyle(color: Colors.black)))
                        ],
                      );
                    }));
              }),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: ((context, index) {
              return ListTile(
                  trailing: Text('$index:00 pm'),
                  subtitle: Text('the message of $index'),
                  title: Text('person $index'),
                  dense: true,
                  leading: index.isEven
                      // ignore: prefer_const_constructors
                      ? CircleAvatar(
                          backgroundImage: const NetworkImage(
                              'https://images.unsplash.com/photo-1494253109108-2e30c049369b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                        )
                      : SizedBox(
                          height: 100.0,
                          width: 50.0, // fixed width and height
                          child: Image.network(
                              'https://images.unsplash.com/photo-1605672510276-37b74d73eb5a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cG9zaXRpb258ZW58MHx8MHx8&w=1000&q=80'),
                        ));
            }),
            separatorBuilder: ((context, index) {
              return const Divider(
                thickness: 1,
                color: Colors.black,
              );
            }),
            itemCount: 30),
      ),
    );
  }
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
  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }

  signout(BuildContext ctx) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
    return Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) {
      return const LoginPage();
    })), (route) => false);
  }
}

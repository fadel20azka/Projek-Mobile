import 'dart:async';
// import 'mainScreen.dart';
import 'package:fadel/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:fadel/helper/shared_preference.dart';
import 'login_page.dart';

class NewSplash extends StatefulWidget {
  const NewSplash({Key? key}) : super(key: key);

  @override
  _NewSplashState createState() => _NewSplashState();
}

class _NewSplashState extends State<NewSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MainMenu()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: SharedPreference().getUsername(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Text(
                  "May The Force Be With You, ${snapshot.data}",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

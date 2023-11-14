import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(25.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 270.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/fadel.png'),
                      ),
                      Text(
                        "Muhammad Fadel Azka",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.yellow),
                      ),
                      Text(
                        "124200059",
                        style: TextStyle(fontSize: 18, color: Colors.yellow),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
          // color: Colors.black,
          // width: (MediaQuery
          //     .of(context)
          //     .size
          //     .width),
          //
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: 10,
          //     ),
          //     Container(
          //       height: 200,
          //       child: Image.asset('assets/fadel.png'),
          //     ),
          //     Container(
          //       child: Column(
          //           children: [ Text("Muhammad Fadel Azka",style: TextStyle(fontSize: 24,color: Colors.yellow)),
          //             Text("124200059",style: TextStyle(fontSize: 24,color: Colors.yellow)),
          //           ]
          //       ),
          //     ),
          //   ],
          // ),

          ),
    );
  }
}

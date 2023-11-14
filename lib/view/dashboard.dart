import 'package:fadel/helper/shared_preference.dart';
import 'package:flutter/material.dart';
import '../mainmenu.dart';
import 'homepage.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(""),
        actions: [
          IconButton(
            onPressed: () {
              SharedPreference().setLogout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
            },
            icon: Icon(Icons.logout),
            color: Colors.yellow,
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: SharedPreference().getUsername(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                // return  Text("Hello, ${snapshot.data}", style: TextStyle(fontSize: 24),);
              return  ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('Hello ${snapshot.data}, May The Force Be With You',style: TextStyle(color: Colors.yellow,fontSize: 25),),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.yellow,width: 3)
                        ),

                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                      return MainMenu();
                    }));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
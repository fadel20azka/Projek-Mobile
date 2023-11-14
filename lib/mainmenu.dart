import 'package:fadel/detail.dart';
import 'package:fadel/helper/data_source.dart';
import 'package:fadel/helper/model.dart';
import 'package:fadel/home.dart';
import 'package:fadel/profil.dart';
import 'package:fadel/view/homepage.dart';
  import 'package:flutter/material.dart';
import 'helper/image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fadel/helper/shared_preference.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

int curentIndex = 0;

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: FutureBuilder(
            future: StarDataSource.instance.loadCharcters(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                ResultModel resultModel = ResultModel.fromJson(snapshot.data);
                return _buildSuccessSection(resultModel);
              }
              return _buildLoadingSection();
            }),
      ),
      Profil()
    ];
    return SafeArea(
        // home : const Home()
        child: Scaffold(
      appBar: AppBar(
        title: Text('STAR WARS',
            style:
                TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        centerTitle: true,
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
          )
        ],
        // automaticallyImplyLeading: true,
        // leading: InkWell(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios_new_rounded,
        //     color: Colors.yellow,
        //   ),

        // ),
      ),
      body: widgets[curentIndex],
      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.yellow,
          activeColor: Colors.black,
          color: Colors.black,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              curentIndex = i;
            });
          }),
    ));
  }

  Widget _buildErrorSection() {
    return Text("error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ResultModel data) {
    return GridView.builder(
      itemCount: data.results?.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        final Results? results = data.results?[index];
        String splice = "${data.results?[index].releaseDate}";
        String result = splice.substring(0, 4);
        final Gambar gambar = GambarList[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailCharacter(result: results, gambars: gambar)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // if you need this
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                    width: 3,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Center(
                        //child: Image.network( gambar.imageUrls,width: 200, height: 130),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                              width: 110,
                              height: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 6, color: Colors.white30)),
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(gambar.imageUrls,
                                      width: 250, height: 330))),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("${data.results?[index].title}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.yellow)),
                    ),
                    Center(
                      child: Text("(${result})",
                          style: TextStyle(fontSize: 14, color: Colors.yellow)),
                    )
                  ]),
                ),
              ),
            ));
      },
    );
  }
}

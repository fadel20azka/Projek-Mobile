import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fadel/helper/shared_preference.dart';
import 'package:fadel/model/data_model.dart';
import 'package:fadel/view/dashboard.dart';
import 'package:fadel/view/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(
        MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark
          ),
            debugShowCheckedModeBanner: false,
            home:
            status ?
            Dashboard() : HomePage()));
  });
  // runApp(const MyApp());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}

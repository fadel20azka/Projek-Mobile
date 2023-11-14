import 'package:fadel/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fadel/helper/hive_database.dart';
import 'package:fadel/helper/shared_preference.dart';
import 'package:fadel/model/data_model.dart';
import 'package:fadel/view/dashboard.dart';
import 'package:fadel/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 125,
              child: Image.asset('assets/starwars.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: "USERNAME",
                  hintText: "Enter your username",
                  contentPadding: EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.yellow, width: 5.0)),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Username cannot be blank' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "PASSWORD",
                  hintText: "Enter your password",
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0)),
                ),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Password cannot be blank' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildLoginButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: _buildRegisterButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(180, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // <-- Radius
          ),
        ),
        child: Text(labelButton),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    if (!found)
      showAlertDialog(context);
    else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NewSplash(),
        ),
      );
      SnackBar snackBar = SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        backgroundColor: Color(0xff0660a9),
        content: Text(
          "Login Success!",
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Register",
      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RegisterPage(),
          ),
        );
      },
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
    title: Text(
      "Login Failed!",
      style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w600),
    ),
    content: Text("Your Username or Password is wrong"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

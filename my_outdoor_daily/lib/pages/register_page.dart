// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/pages/login_page.dart';
import 'package:my_outdoor_daily/service/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  // ignore: prefer_final_fields
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "REGISTER PAGE",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset("assets/images/myoutdoordaily.jpg"),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "E-Mail",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: _passwordAgainController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                ),
              ),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => RaisedButton(
        child: const Text("REGISTER"),
        onPressed: () {
          _authService
              .createPerson(_nameController.text, _emailController.text,
                  _passwordController.text)
              .then((value) {
            return Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          });
        },
      );
}

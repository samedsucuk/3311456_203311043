// ignore_for_file: deprecated_member_use
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/pages/main_page.dart';
import 'package:my_outdoor_daily/pages/register_page.dart';
import 'package:my_outdoor_daily/service/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ignore: prefer_final_fields
  AuthService _authService = AuthService();
  late FirebaseAuth _auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      _auth = FirebaseAuth.instance;

      _auth.authStateChanges().listen((User? user) {
        if (user == null) {
          debugPrint('kullanıcı yok!');
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "LOGIN PAGE",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Image.asset("assets/images/myoutdoordaily.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                      child: const Text('Register'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      }),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () async {
                    try {
                      await _auth
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) => Navigator.pushReplacementNamed(
                              context, "/mainpage"));
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: const Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}

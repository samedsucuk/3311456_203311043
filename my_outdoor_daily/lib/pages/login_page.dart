// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          key: _formKey,
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
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Kullanıcı Adı",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kullanıcı Adını Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (kullaniciadi) {
                    username = kullaniciadi;
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: "Şifre",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Şifrenizi Giriniz";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (sifre) {
                    password = sifre;
                  },
                  obscureText: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(child: const Text('Üye Ol'), onPressed: () {}),
                  MaterialButton(
                      child: const Text('Şifremi Unuttum'), onPressed: () {})
                ],
              ),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => RaisedButton(
        child: const Text("Giriş Yap"),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();
            if (username == "admin" && password == "admin") {
              Navigator.pushReplacementNamed(context, "/mainpage");
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Hata"),
                      content: const Text("Giriş Bilgileriniz Hatalı"),
                      actions: <Widget>[
                        MaterialButton(
                          child: const Text("Geri Dön"),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    );
                  });
            }
          }
        },
      );
}

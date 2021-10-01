import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/newpage.dart';

class Signing extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> loggin(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
    } catch (e) {
      print(e);
    }
    print("sign in success");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Mainpage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "enter email",
                  hintText: "email",
                ),
                controller: email,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "enter password",
                  hintText: "password",
                ),
                controller: password,
              ),
              SizedBox(
                height: 19,
              ),
              ElevatedButton(
                child: Text("login"),
                onPressed: () {
                  loggin(context);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mysign extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  Future<void> myysign() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      print(e);
    }
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
          title: Text("Bank Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Enter username",
                        hintText: "username",
                      ),
                      controller: username,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Enter email",
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
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        child: Text("Register"),
                        onPressed: () {
                          myysign();
                          var msg = SnackBar(
                            content: Text("registered successfully"),
                            duration: Duration(seconds: 5),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(msg);
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

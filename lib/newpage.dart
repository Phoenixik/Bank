import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome page"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Text(
              "Welcome to Phoenix bank, /n thank you for banking with us",
              style: TextStyle(
                fontSize: 25,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

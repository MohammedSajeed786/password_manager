//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:password_manager/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 40,),
              Text(
                "WELCOME TO PASSWORD MANAGER",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                "https://www.cinderellaeco.com//images/articles/1569502693210_register_product.jpg",
                // height: 650,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("To continue please login",
                      style: TextStyle(fontSize: 16.0)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    signInWithGoogle(context);
                  },
                  child: Row(
                    children: [
                      Image.network(
                        "https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Google-512.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Continue with gmail",
                          style: TextStyle(fontSize: 16))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

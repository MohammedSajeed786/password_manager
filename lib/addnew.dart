//import 'dart:ui';
import 'package:encrypt/encrypt.dart' as en;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/encrypt_decrypt.dart';

class New extends StatefulWidget {
  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  String network, name, password;
  var key, encrypter, iv, plainText, encrypted;
  @override
  Widget build(BuildContext context) {
    var keyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Center(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!keyboard)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Please",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Add",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.grey)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Data",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.grey)),
                  ],
                ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (val) {
                  network = val;
                },
                style: TextStyle(color: Colors.grey, fontSize: 20),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Network",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  onChanged: (val) {
                    name = val;
                  },
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Username/Email/Phone",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  )),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  onChanged: (val) {
                    password = val;
                  },
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // // plainText = password;
                      // // key = en.Key.fromLength(32);
                      // // iv = en.IV.fromLength(16);

                      // // encrypter = en.Encrypter(en.AES(key));

                      // // encrypted = encrypter.encrypt(plainText, iv: iv);
                      // //final decrypted = encrypter.decrypt(encrypted, iv: iv);
                      // final key = en.Key.fromLength(32);
                      // final iv = en.IV.fromLength(16);
                      // final encrypter = en.Encrypter(en.AES(key));

                      // final encrypted = encrypter.encrypt(password, iv: iv);
                      // final decrypted = encrypter.decrypt(encrypted, iv: iv);

                      // print(decrypted);
                      // print(encrypted.bytes);
                      // print(encrypted.base16);
                      // //print(encrypted.base64);

                      add();
                    },
                    child: Text("Save"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  void add() async {
  //  var decdata = widget.data['password'];
    // final key = en.Key.fromLength(32);
    // final iv = en.IV.fromLength(16);
    // final encrypter = en.Encrypter(en.AES(key));

    // var pwd = encrypter.decrypt(dec, iv: iv);
    //print("hello" + pwd);
    CollectionReference ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("hide");
    var data = {
      "network": network,
      "name": name,
      "password": Encrypt_decrypt.encrypt(password),
      //password,
      //password,
      //encrypted,
      "time": DateTime.now(),
    };
    //if(name !=null and password!=null && network!=null){
    ref.add(data);
    //}
    Navigator.pop(context);
  }
}

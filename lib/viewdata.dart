import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as en;
import 'package:password_manager/encrypt_decrypt.dart';

class ViewData extends StatefulWidget {
  final Map data;
  final DocumentReference ref;
  final String date;
  ViewData(this.data, this.date, this.ref);
  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  String pwd;
  // String getpwd() {
  //   var decdata = widget.data['password'];
  //   final key = en.Key.fromLength(32);
  //   final iv = en.IV.fromLength(16);
  //   final encrypter = en.Encrypter(en.AES(key));

  //   pwd = encrypter.decrypt(decdata, iv: iv);
  // }
   @override
  void initState() { 
    super.initState();
    //getpwd();
  }
   

  //String decdata = widget.data['password'];
  //var x = widget.date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Here's",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Your",
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
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 8, 0),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Network: " + widget.data['network'],
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Username/Email/Phone: " + widget.data['name'],
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Password: " + Encrypt_decrypt.decrypt(
                  widget.data["password"]).toString(),
                  //widget.data["password"],
                  //pwd,
                      //widget.data["password"],
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Date: " + widget.date,
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.grey),
          ),
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
                child: Text("Back", style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  delete();
                },
                child: Text("Delete", style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
              ),
            ],
          )
        ],
      ),
    ));
  }

  void delete() async {
    await widget.ref.delete();
    Navigator.pop(context);
  }
}

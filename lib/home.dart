import 'dart:math';
//import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:password_manager/addnew.dart';
import 'package:password_manager/controller/google_auth.dart';
import 'package:password_manager/login.dart';
import 'package:password_manager/viewdata.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color> newcol = [
    Colors.yellow[50],
    Colors.red[50],
    Colors.green[50],
    Colors.deepPurple[50],
  ];
  CollectionReference ref = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("hide");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Social Accounts",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        //backgroundColor: Color(0xffffffff),
        elevation: 0.0,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                User user = FirebaseAuth.instance.currentUser;
                print("before" + user.toString());
                await FirebaseAuth.instance.signOut();
               //  user = FirebaseAuth.instance.currentUser;
                print("After" + user.toString());
                
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
                 
              }),
          SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //return null;
            return New();
          })).then((value) {
            setState(() {});
          });
        },
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    Random r = new Random();
                    Color col = newcol[r.nextInt(4)];
                    Map data = snapshot.data.docs[index].data();
                    DateTime date = data['time'].toDate();
                    String formatdate =
                        DateFormat.yMMMd().add_jm().format(date);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ViewData(data, formatdate,
                              snapshot.data.docs[index].reference);
                        })).then((value) {
                          setState(() {});
                        });
                      },
                      child: Card(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${data['network']}",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 24.0),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  DateFormat.yMMMd().add_jm().format(date),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              );
            }
          }),
    );
  }
}

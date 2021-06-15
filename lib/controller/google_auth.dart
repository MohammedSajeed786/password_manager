//import 'package:firebase/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';

//firebase core:- Initialise firebase
//firebase auth:- firebse authentication
//google sign in :- google sign-in
//GoogleSignIn gsignin = GoogleSignIn();
CollectionReference users = FirebaseFirestore.instance.collection('users');
signInWithGoogle(BuildContext context) async {
  try {
    //POPS THE USER ACCOUNTS ON SCREEN AND WE SELECT A ACCOUNT and googleuser contain info about user
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // print("1." + googleUser.toString());
    if (googleUser != null) {
      //GETTING USER AUTHENTICATION DETAILS INORDER TO CREATE FIREBASE firestore LOGIN ACCOUNT
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      //create a credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //with that credential sign in the user into the firebase

      //userCredential contains extra user info and uder goes forward into app
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      //user will contain useful user data with methods
      final User user = userCredential.user;
      var data = {
        "name": googleUser.displayName,
        'provider': 'google',
        'photoUrl': googleUser.photoUrl,
        'email': googleUser.email,
      };
      //if user exists update details else create details-key value pairs
      users.doc(user.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(data);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        } else {
          users.doc(user.uid).set(data);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
  } catch (PlatformException) {
    print(PlatformException);
    print("sign in not successful");
  }
}                      
// collection:-               colleection :-hide->doc11,doc12,doc13.....(password:"",name:"")
// users->      doc1->      "name": googleUser.displayName,
//             (user1.uid)      'provider': 'google',
//                         'photoUrl': googleUser.photoUrl,
//                         'email': googleUser.email,

             


//              doc2->      "name": googleUser.displayName,
//             (user2.uid)      'provider': 'google',
//                         'photoUrl': googleUser.photoUrl,
//                         'email': googleUser.email,
             

               
//              doc3->      new user so no data hence we will create data  
//             (user3.uid)


//              doc4->       "name": googleUser.displayName,
//              (user4.uid)        'provider': 'google',
//                         'photoUrl': googleUser.photoUrl,
//                         'email': googleUser.email,
            

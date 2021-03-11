import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/home/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("users", isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> docs = result.docs;

      if (docs.length == 0) {
        // insert the user to our collections
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoURL
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.displayName);
      } else {
        await preferences.setString("id", docs[0]["id"]);
        await preferences.setString("username", docs[0]["username"]);
        await preferences.setString("photoUrl", docs[0]["photoUrl"]);
      }
      Fluttertoast.showToast(msg: "Logged in");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          Center(
            child: MaterialButton(onPressed: (){
              handleSignIn();
            },
            child: Text("Signin / Signup with google"),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor:  AlwaysStoppedAnimation <Color>(Colors.red),
              ),
            )
          )
        ],
      ),
    );
  }
}

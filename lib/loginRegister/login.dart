// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/screens/profileScreen.dart';
import 'register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    //    initializing controllers for email,password

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    //    logging in user in cloud firestore and firebase authentication

    void loginUser() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot snapshot =
            await firestore.collection('users').doc(user.user.uid).get();
        final data = snapshot.data();

        //    show dialog wgen data entered successfully

        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Login Successfully'),
                  content: SingleChildScrollView(
                      child: Text(
                    'email: $email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));

        //      navigate to profile

        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      } catch (e) {
        print('error: $e');
      }
    }

    return Scaffold(
      //    app bar

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      //    body
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
            child: Column(
          children: [
            //    textfield for email

            TextFormField(
              controller: emailController,
              maxLength: 20,
              decoration: const InputDecoration(
                  labelText: 'Enter email', icon: Icon(Icons.email)),
            ),

            //    textfield for password

            TextFormField(
              obscureText: _isHidden,
              maxLength: 15,
              controller: passwordController,
              validator: (val) => val.length < 6 ? 'Password too short.' : null,
              decoration: InputDecoration(
                labelText: 'Enter passowrd',
                icon: Icon(Icons.password),
                suffixIcon:
                    InkWell(onTap: () {}, child: Icon(Icons.visibility)),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //    login button
            OutlinedButton.icon(
              icon: Icon(Icons.login),
              onPressed: loginUser,
              label: Text("Login"),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade50),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //    registration button
            OutlinedButton.icon(
              icon: Icon(Icons.app_registration),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Register()));
              },
              label: Text("Register Here"),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade50),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

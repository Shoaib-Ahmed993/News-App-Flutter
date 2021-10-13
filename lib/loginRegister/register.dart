import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/screens/profileScreen.dart';
import 'package:news_app/views/home.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {

    //    initializing controllers for username,email,password,phone&address
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();


    //    registering user in cloud firestore and firebase authentication

    void registerUser() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      final String username = usernameController.text;
      final String phone = phoneController.text;
      final String address = addressController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await firestore.collection('users').doc(user.user.uid).set({
          'username': username,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address
        });


        //    show dialog wgen data entered successfully

        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Registered Successfully'),
                  content: SingleChildScrollView(
                      child: Text(
                    'name: $username \nemail: $email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),

                      //    navigate to profile screen
                      
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                      },
                    ),
                  ],
                ));
      } catch (e) {
        print('error: $e');
      }
    }


    //      navigate to home screen

    void backToHome() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
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
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),


      //      body

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
              child: Column(
            children: [

              //    username textfield

              TextFormField(
                controller: usernameController,
                maxLength: 20,
                decoration: const InputDecoration(
                    labelText: 'Enter username',
                    icon: Icon(Icons.person_add_alt)),
              ),

              //    phone textfield

              TextFormField(
                controller: phoneController,
                maxLength: 20,
                decoration: const InputDecoration(
                    labelText: 'Enter phone', icon: Icon(Icons.phone_android)),
              ),

              //    address textfield

              TextFormField(
                controller: addressController,
                maxLength: 50,
                decoration: const InputDecoration(
                    labelText: 'Enter address', icon: Icon(Icons.place)),
              ),

              //    email textfield

              TextFormField(
                controller: emailController,
                maxLength: 20,
                decoration: const InputDecoration(
                    labelText: 'Enter email', icon: Icon(Icons.email)),
              ),

              //    password textfield

              TextFormField(
                obscureText: true,
                maxLength: 15,
                controller: passwordController,
                validator: (val) => val.length < 6 ? 'Password too short.' : null,
                decoration: const InputDecoration(
                    labelText: 'Enter passowrd', icon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [

                  //    registration button

                  ElevatedButton.icon(
                    icon: Icon(Icons.app_registration),
                    onPressed: registerUser,
                    label: Text("Register Account"),
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
                  SizedBox(
                    height: 15,
                  ),

                  //    back button

                  ElevatedButton.icon(
                    icon: Icon(Icons.home),
                    onPressed: backToHome,
                    label: Text("Back to Home"),
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
              ),
            ],
          )),
        ),
      ),
    );
  }
}

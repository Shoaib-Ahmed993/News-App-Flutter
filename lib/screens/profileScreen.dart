import 'package:flutter/material.dart';
import 'package:news_app/screens/homeScreen.dart';
import 'package:news_app/screens/searchScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //    App Bar
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Flutter",
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 150,
                  height: MediaQuery.of(context).size.height,
                  child: Image(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                title: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'abc@gmail.com\n\n',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'logout\n\n',
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w300))
                ])),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      'Account Information'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: 'Full Name \n',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: 'user\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300)),
                      ])),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Email \n',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'user@gmail.com\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300))
                      ])),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Phone \n',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '+0900-786 01\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300))
                      ])),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Address \n',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'New York,Random Street House No. 72\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300))
                      ])),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Gender \n',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Male\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300))
                      ])),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Date of Birth \n',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'October 13, 1999\n',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300))
                      ])),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.home_filled),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                label: Text('Back to Home'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text('Back'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

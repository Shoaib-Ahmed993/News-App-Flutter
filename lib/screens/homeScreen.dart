import 'package:flutter/material.dart';
import 'package:news_app/loginRegister/login.dart';
import 'package:news_app/loginRegister/register.dart';
import 'package:news_app/screens/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //      Appbar
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("Home"),
              ),
              Tab(
                child: Text("Top Stories"),
              ),
              Tab(
                child: Text("Headlines"),
              ),
              Tab(
                child: Text("Popular News"),
              ),
              Tab(
                child: Text("Sports News"),
              ),
            ],
          ),
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

        //    body
        body: Container(
          child: TabBarView(
            children: [
              Column(
                children: [
                  // Text("Images"),
                  // Text("Videos"),
                ],
              ),
              Column(
                children: [
                  Text("Images"),
                  Text("Videos"),
                ],
              ),
              Column(
                children: [
                  Text("Images"),
                  Text("Videos"),
                ],
              ),
              Column(
                children: [
                  Text("Images"),
                  Text("Videos"),
                ],
              ),
              Column(
                children: [
                  Text("Images"),
                  Text("Videos"),
                ],
              ),
            ],
          ),
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/drawerImage.jpg'),
                      ),
                    ),
                  ),
                ),


                ListTile(
                  hoverColor: Colors.black,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.login_sharp, size: 15, color: Colors.black,),
                        ),
                        TextSpan(
                          text: " Login Page",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.app_registration_outlined, size: 15, color: Colors.black,),
                        ),
                        TextSpan(
                          text: " Registration Page",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.search_outlined, size: 15, color: Colors.black,),
                        ),
                        TextSpan(
                          text: " Search Page",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

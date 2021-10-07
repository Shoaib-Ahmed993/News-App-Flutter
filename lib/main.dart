import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/views/home.dart';
import 'loginRegister/login.dart';
import 'loginRegister/register.dart';
import 'screens/searchScreen.dart';
import 'screens/favouriteScreen.dart';
import 'screens/profileScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primaryColor: Colors.white),
            home: Home(),
            routes: {
              '/favourite': (context) => FavouriteScreen(),
              '/search': (context) => SearchScreen(),
              '/profile': (context) => ProfileScreen(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

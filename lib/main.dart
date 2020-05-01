import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteapp/flavor.dart';
import 'package:noteapp/my_app.dart';
import 'package:noteapp/providers/auth_provider.dart';
import 'package:noteapp/providers/language_provider.dart';
import 'package:noteapp/providers/theme_provider.dart';
import 'package:noteapp/services/firestore_database.dart';
import 'package:provider/provider.dart';

// import 'package:firebase/firebase.dart' as fb;

void main() {
  // fb.initializeApp(
  //   apiKey: "AIzaSyA7BRas0BpsGQPpCMZiNnSXHvjbE5Tn5_s",
  //   authDomain: "edicon-dev.firebaseapp.com",
  //   databaseURL: "https://edicon-dev.firebaseio.com",
  //   projectId: "edicon-dev",
  //   storageBucket: "edicon-dev.appspot.com",
  //   messagingSenderId: "741585694427",
  //   appId: "1:741585694427:web:5fe94dba269889099ba6fe",
  //   measurementId: "G-HQGHXK2LQS"
  // );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(
      /*
      * MultiProvider for top services that do not depends on any runtime values
      * such as user uid/email.
       */
      MultiProvider(
        providers: [
          Provider<Flavor>.value(value: Flavor.dev),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
        ],
        child: MyApp(
          databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
        ),
      ),
    );
  });
}

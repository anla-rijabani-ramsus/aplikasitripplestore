import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripplestore/routes.dart';
import 'package:tripplestore/screens/profile/profile_screen.dart';
import 'package:tripplestore/screens/splash/splash_screen.dart';
import 'package:tripplestore/service/service.dart';
import 'package:tripplestore/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(value: Fireservice.userStream),
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TrippleStore',
        theme: theme(),
        // home: SplashScreen(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}

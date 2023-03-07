import 'package:creativa_flutter/home_screen.dart';
import 'package:creativa_flutter/login_screen.dart';
import 'package:creativa_flutter/search_screen.dart';
import 'package:creativa_flutter/splash_screen.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => HomeScreen(),
        'splash':(context) => SplashScreen(),
        'login':(context) => LoginScreen(),
        'search':(context) => SearchScreen(),
      },
      initialRoute:'splash',
      //home: LoginScreen(),
    );
  }
}

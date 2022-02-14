import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/screens/sign_in/sign_in_page.dart';
import 'package:taxi_app/screens/splash/splash.dart';

import 'screens/chat/home_chat.dart';
import 'screens/verify/verify_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
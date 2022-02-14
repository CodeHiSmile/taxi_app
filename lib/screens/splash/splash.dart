import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_images.dart';
import 'package:taxi_app/screens/sign_in/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SignInPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            AppImages.imgSplash,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

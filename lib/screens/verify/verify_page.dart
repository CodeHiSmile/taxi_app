import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_gradient.dart';
import 'package:taxi_app/commons/app_images.dart';
import 'package:taxi_app/screens/chat/home_chat.dart';
import 'package:taxi_app/screens/sign_in/button_default.dart';

import 'item_pin.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focus4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppGradient.gradientSplash,
              ),
              padding: const EdgeInsets.only(top: 35, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(AppImages.icBack),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Phone Verificaion",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Enter your OTP code here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 40),
              child: RichText(
                textAlign: TextAlign.center,
                strutStyle: const StrutStyle(
                  height: 2,
                ),
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Enter the 4 digit code we just sent to",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "\n+19685121212",
                      style: TextStyle(
                        color: AppColors.greenTop,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 26),
              //https://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@github.com/CodeHiSmile/homework1.git
              height: 51,
              child: Row(
                children: <Widget>[
                  ItemPin(
                    autoFocus: true,
                    focus: focus1,
                    onCallBack: () {
                      FocusScope.of(context).requestFocus(focus2);
                    },
                  ),
                  ItemPin(
                    focus: focus2,
                    onCallBack: () {
                      FocusScope.of(context).requestFocus(focus3);
                    },
                  ),
                  ItemPin(
                    focus: focus3,
                    onCallBack: () {
                      FocusScope.of(context).requestFocus(focus4);
                    },
                  ),
                  ItemPin(
                    focus: focus4,
                    onCallBack: () {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: ButtonDefault(
                title: "SIGN IN",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeChatPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taxi_app/commons/app_colors.dart';
import 'package:taxi_app/commons/app_gradient.dart';
import 'package:taxi_app/commons/app_images.dart';
import 'package:taxi_app/screens/sign_in/phone_select.dart';
import 'package:taxi_app/screens/verify/verify_page.dart';

import 'button_default.dart';
import 'icon_border.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        child: InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    gradient: AppGradient.gradientSplash,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          AppImages.icLogo,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        left: 20,
                        child: Container(
                          height: 77,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 3,
                                color: AppColors.greenTop,
                              ),
                            ),
                            tabs: const [
                              Tab(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.greenTop,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: AppColors.greenTop,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: TabBarView(
                    controller: _tabController,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.greenShadow,
                                      offset: Offset(0, 6),
                                      blurRadius: 43,
                                    )
                                  ],
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 24),
                                        height: 51,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.greyBorder,
                                            width: 1,
                                          ),
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.greyBorder,
                                            ),
                                            hintText: 'name@exsample.com',
                                            border: InputBorder.none,
                                            // contentPadding: EdgeInsets.only(bottom: 11),
                                          ),
                                          maxLines: 1,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                      const PhoneSelected(),
                                      ButtonDefault(
                                        title: "SIGN UP",
                                        onTap: ()  {
                                          FocusScope.of(context).unfocus();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => const VerifyPage(),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                IconBorder(image: AppImages.icFacebook),
                                IconBorder(image: AppImages.icGoogle),
                                IconBorder(image: AppImages.icInstagram),
                                IconBorder(image: AppImages.icFace),
                              ],
                            ),
                            const SizedBox(height: 23),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "By signing in you agree to our ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Terms of use",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greenShadow,
                                  offset: Offset(0, 6),
                                  blurRadius: 43,
                                )
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 24),
                                const Text(
                                  "Login with your Phone Number",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const PhoneSelected(),
                                ButtonDefault(
                                  title: "SIGN IN",
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const VerifyPage(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

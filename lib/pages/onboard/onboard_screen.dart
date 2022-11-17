import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:crowd/util/dimensions.dart';
import 'package:crowd/widget/small_text.dart';
import 'package:crowd/widget/button_widget.dart';
import 'package:get/get.dart';
import 'package:crowd/routes/route.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/onboard1.svg",
            height: Dimensions.height40 * 8,
            width: Dimensions.width40 * 8,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "CrowdSourcing",
                  style: TextStyle(
                      color: Colors.blue, fontSize: Dimensions.font20),
                  children: const [
                    TextSpan(
                        text: " Emergency ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(text: "To", style: TextStyle(color: Colors.blue)),
                    TextSpan(
                        text: "Notify", style: TextStyle(color: Colors.blue))
                  ])),
          SizedBox(
            height: Dimensions.height20,
          ),
          SmallText(
            text:
                "Crowdsouring to notify our users about the most immediate emergency",
            color: Colors.black,
          ),
          SizedBox(
            height: Dimensions.height30 * 2,
          ),
          ButtonWidget(
            text: "Login",
            color: Colors.blue,
            width: Dimensions.width40 * 12,
            height: Dimensions.height40 * 1.3,
            pressed: () => Get.toNamed(RouteHelper.getLogin()),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          ButtonWidget(
            text: "Sign up",
            color: Colors.black,
            width: Dimensions.width40 * 12,
            height: Dimensions.height40 * 1.3,
            pressed: () => Get.toNamed(RouteHelper.getRegister()),
          ),
        ],
      ),
    );
  }
}

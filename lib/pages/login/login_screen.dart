import 'package:flutter/material.dart';
import 'package:crowd/widget/big_text.dart';
import 'package:crowd/util/dimensions.dart';
import 'package:crowd/widget/small_text.dart';
import 'package:crowd/widget/textfield_widget.dart';
import 'package:crowd/widget/button_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:crowd/routes/route.dart';
import 'package:crowd/pages/login/login_controller.dart';
import 'package:crowd/widget/container_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
              top: Dimensions.height40,
              left: Dimensions.height20,
              right: Dimensions.height20),
          children: [
            BigText(
              text: "Welcome Back",
              color: Colors.black,
              size: Dimensions.font20,
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            BigText(
              text: "Login",
              color: Colors.black,
              size: Dimensions.font16,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            AppTextField(
                textEditingController: context.read<LoginController>().email,
                hintText: "Enter Email"),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              textEditingController: context.read<LoginController>().password,
              hintText: "Enter Password",
              obscure: true,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.mark_chat_read_outlined,
                      size: Dimensions.icon16,
                    )),
                    TextSpan(
                        text: "Remember Me",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.font15 / 1.1))
                  ])),
                  Text("Forget Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font15 / 1.1))
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            ValueListenableBuilder(
                valueListenable: context.read<LoginController>().loadstate,
                builder: (context, ref, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ref == false
                          ? ButtonWidget(
                              text: "Login",
                              color: Colors.blue,
                              width: Dimensions.width40 * 12,
                              height: Dimensions.height40 * 1.3,
                              pressed: () => context
                                  .read<LoginController>()
                                  .loginAccount(),
                            )
                          : Container(
                              width: 40,
                              height: 40,
                              child: const CircularProgressIndicator(
                                strokeWidth: 6,
                              ))
                    ],
                  );
                }),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: "OR",
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            ContainerWidget(
              widget: RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.account_circle_outlined,
                  size: Dimensions.icon20,
                  color: Colors.white,
                )),
                const TextSpan(text: " "),
                TextSpan(
                  text: "Google Login",
                  style: TextStyle(
                      color: Colors.white, fontSize: Dimensions.font16),
                )
              ])),
              color: Colors.black,
              width: Dimensions.width20,
              height: Dimensions.height40 * 1.3,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.offNamed(RouteHelper.getRegister()),
                  child: RichText(
                      text: TextSpan(
                          text: "Don't have account",
                          style: TextStyle(
                              fontSize: Dimensions.font16, color: Colors.black),
                          children: [
                        TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                color: Colors.blue))
                      ])),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
import 'package:crowd/pages/register/registercontroller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              text: "Welcome",
              color: Colors.black,
              size: Dimensions.font20,
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            BigText(
              text: "Sign Up",
              color: Colors.black,
              size: Dimensions.font16,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            AppTextField(
                textEditingController: context.read<RegisterController>().name,
                hintText: "Full name"),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: context.read<RegisterController>().email,
                hintText: "Email"),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: context.read<RegisterController>().phone,
                hintText: "Phone No"),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              textEditingController:
                  context.read<RegisterController>().password,
              hintText: "Password",
              obscure: true,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController:
                    context.read<RegisterController>().confirmPassword,
                hintText: "Confirm Password",
                obscure: true),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.mark_chat_read_outlined,
                        size: Dimensions.icon16,
                      )),
                      TextSpan(
                          text: " i agree to the",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Dimensions.font15)),
                      TextSpan(
                          text: " terms and condition",
                          style: TextStyle(
                              color: Colors.blue, fontSize: Dimensions.font15))
                    ])),
              ],
            ),
            SizedBox(
              height: Dimensions.height40,
            ),
            ValueListenableBuilder(
                valueListenable: context.read<RegisterController>().loadstate,
                builder: (context, ref, child) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ref == false
                          ? ButtonWidget(
                              text: "Sign Up",
                              color: Colors.black,
                              width: Dimensions.width40 * 12,
                              height: Dimensions.height40 * 1.3,
                              pressed: () => context
                                  .read<RegisterController>()
                                  .createAccount(),
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              child: const CircularProgressIndicator())
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}

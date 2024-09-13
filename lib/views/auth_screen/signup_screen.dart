import 'package:e_store_fawad/controllers/auth_controller.dart';
import 'package:e_store_fawad/views/auth_screen/login_screen.dart';
import 'package:e_store_fawad/views/home_screen/home.dart';
import 'package:e_store_fawad/widgets_common/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:e_store_fawad/consts/consts.dart';

import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:e_store_fawad/widgets_common/applogo_widget.dart';
import 'package:e_store_fawad/widgets_common/custom_textfield.dart';
import 'package:e_store_fawad/widgets_common/our_button.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());
  //text Controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgwidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Join the $appname".text.fontFamily(bold).white.size(22).make(),
          10.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(name, nameHint, nameController, false),
                5.heightBox,
                customTextField(
                    email, "abcd@gmail.com", emailController, false),
                5.heightBox,
                customTextField(pasword, "P@ssw0rd", passwordController, true),
                5.heightBox,
                customTextField(retypePassword, "retype here!",
                    passwordRetypeController, true),
                5.heightBox,
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: forgetPassword.text
                            .color(Vx.blue300)
                            .size(11)
                            .bold
                            .make())),
                Row(children: [
                  Checkbox(
                    activeColor: redColor,
                    checkColor: whiteColor,
                    value: isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        isChecked = newValue;
                      });
                    },
                  ),
                ]),
                const PrivacyBox(),
                5.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : ourButton(() async {
                        if (isChecked != false) {
                          controller.isLoading(true);
                          try {
                            await controller
                                .signUpMethod(emailController.text,
                                    passwordController.text, context)
                                .then((value) {
                              return controller.storeUserData(
                                  nameController.text,
                                  passwordController.text,
                                  emailController.text);
                            }).then((value) {
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(() => const Home());
                            });
                          } catch (e) {
                            controller.isLoading(false);
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }
                        }
                      }, isChecked == true ? redColor : fontGrey, whiteColor,
                            signUp)
                        .box
                        .width(context.screenWidth - 200)
                        .make(),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                          fontFamily: semibold, color: fontGrey, fontSize: 12)),
                  TextSpan(
                      text: " Login",
                      style: TextStyle(
                          fontFamily: semibold,
                          color: Vx.blue500,
                          fontSize: 14)),
                ])).onTap(() {
                  Get.to(const LoginScreen());
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
          ),
        ],
      )),
    ));
  }
}

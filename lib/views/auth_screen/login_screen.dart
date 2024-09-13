import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/controllers/auth_controller.dart';
import 'package:e_store_fawad/views/auth_screen/signup_screen.dart';
import 'package:e_store_fawad/views/home_screen/home.dart';
import 'package:e_store_fawad/widgets_common/applogo_widget.dart';
import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:e_store_fawad/widgets_common/custom_textfield.dart';
import 'package:e_store_fawad/widgets_common/our_button.dart';
import 'package:e_store_fawad/widgets_common/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgwidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Login to $appname".text.fontFamily(bold).white.size(22).make(),
          10.heightBox,
          Obx(
            () => Column(
              children: [
                customTextField(
                    email, "abc@gmail.com", controller.emailController, false),
                5.heightBox,
                customTextField(
                    pasword, "P@ssw0rd!", controller.passwordController, true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: forgetPassword.text.gray400.bold.make())),
                5.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : ourButton(() async {
                        controller.isLoading(true);
                        await controller.loginMethod(context).then((value) {
                          if (value != null) {
                            VxToast.show(context, msg: loggedIn);
                            Get.offAll(() => const Home());
                          } else {
                            controller.isLoading(false);
                            VxToast.show(context, msg: invalidUser);
                          }
                        });
                      }, redColor, whiteColor, login)
                        .box
                        .width(context.screenWidth - 200)
                        .make(),
                5.heightBox,
                createNewAccount.text.color(Vx.blue400).semiBold.make(),
                10.heightBox,
                ourButton(() {
                  Get.to(const SignUpScreen());
                }, lightGrey, redColor, signUp),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    socialIcons(icFacebookLogo),
                    5.widthBox,
                    socialIcons(icGoogleLogo),
                    5.widthBox,
                    socialIcons(icTwitterLogo),
                  ],
                )
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

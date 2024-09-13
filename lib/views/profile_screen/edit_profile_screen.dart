import 'dart:io';
import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/controllers/profile_controller.dart';
import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:e_store_fawad/widgets_common/custom_textfield.dart';
import 'package:e_store_fawad/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    var controller = Get.find<ProfileController>();
    return bgwidget(Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 130,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 130,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(() {
                  controller.changeImage(context);
                }, redColor, whiteColor, "Change"),
                const Divider(),
                10.heightBox,
                customTextField(
                    name, nameHint, controller.nameController, false),
                customTextField(
                    pasword, passwordHint, controller.passwordController, true),
                20.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 90,
                        child: ourButton(() async {
                          controller.isLoading(true);
                          await controller.uploadProfileImage();
                          await controller.updateProfile(
                              controller.nameController.text,
                              controller.passwordController.text,
                              controller.profielImageLink);
                          VxToast.show(context, msg: "Profile updated");
                        }, redColor, whiteColor, "Save"))
              ],
            )
                .box
                .shadowSm
                .rounded
                .gray100
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, right: 12, left: 12))
                .gray200
                .make(),
          ),
        )));
  }
}

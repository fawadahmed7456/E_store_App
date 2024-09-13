import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/consts/lists.dart';
import 'package:e_store_fawad/controllers/auth_controller.dart';
import 'package:e_store_fawad/controllers/profile_controller.dart';
import 'package:e_store_fawad/services/firestore_services.dart';
import 'package:e_store_fawad/views/home_screen/home.dart';
import 'package:e_store_fawad/views/profile_screen/details_cart.dart';
import 'package:e_store_fawad/views/profile_screen/edit_profile_screen.dart';
import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgwidget(Scaffold(
        body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];
                return SafeArea(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(children: [
                          const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.edit, color: whiteColor))
                              .onTap(() {
                            Get.to(() => EditProfileScreen(data: data));
                            controller.nameController.text = data['name'];
                            controller.passwordController.text =
                                data['password'];
                          }),
                          Row(children: [
                            Image.asset(
                              imgProfile2,
                              width: 130,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                            10.widthBox,
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  "${data['name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .white
                                      .make(),
                                  5.heightBox,
                                  "${data['email']}".text.white.make()
                                ])),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: whiteColor)),
                                onPressed: () async {
                                  await Get.put(AuthController())
                                      .signOutMethod(context);
                                  Get.offAll(() => const Home());
                                },
                                child: "Logout".text.white.make())
                          ]),
                          20.heightBox,
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                cartDetails(130, "${data['cart_count']}",
                                    "In your Cart"),
                                10.widthBox,
                                cartDetails(130, "${data['wishList_count']}",
                                    "In your WishList"),
                                10.widthBox,
                                cartDetails(130, "${data['order_count']}",
                                    "You Ordered"),
                              ])),
                          15.heightBox,
                          ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: lightGrey,
                                    );
                                  },
                                  itemCount: profileButtonList.length,
                                  itemBuilder: ((BuildContext context, index) {
                                    return ListTile(
                                      leading: Image.asset(
                                        profileIconsList[index],
                                        width: 22,
                                      ),
                                      title: profileButtonList[index]
                                          .text
                                          .fontFamily(semibold)
                                          .color(fontGrey)
                                          .make(),
                                    );
                                  }))
                              .box
                              .rounded
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 16))
                              .shadowSm
                              .white
                              .margin(const EdgeInsets.all(12))
                              .make()
                        ])));
              }
            }))));
  }
}

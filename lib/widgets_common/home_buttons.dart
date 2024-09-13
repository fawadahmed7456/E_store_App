import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButton(width, height, icon, String title, onPress) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 25,
      ),
      5.heightBox,
      title.text.fontFamily(semibold).make()
    ],
  ).box.rounded.size(width, height).white.make();
}

import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton(icon, String title) {
  return Container(
    color: whiteColor,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            icon,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),
        10.widthBox,
        title.text
            .fontFamily(semibold)
            .align(TextAlign.left)
            .color(fontGrey)
            .make(),
      ],
    )
        .box
        .roundedSM
        .color(lightGrey)
        .margin(const EdgeInsets.symmetric(horizontal: 4))
        .width(220)
        .outerShadow
        .padding(const EdgeInsets.all(12))
        .make(),
  );
}

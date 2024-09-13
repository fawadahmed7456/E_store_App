import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget cartDetails(double width, String count, String title) {
  return Column(
    children: [
      count.text.size(18).fontFamily(bold).black.make(),
      5.heightBox,
      title.text.black.make()
    ],
  ).box.roundedSM.width(width).white.padding(const EdgeInsets.all(10)).make();
}

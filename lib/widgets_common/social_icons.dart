import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget socialIcons(title) {
  return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
    CircleAvatar(
        backgroundColor: lightGrey,
        radius: 20,
        child: Image.asset(
          title,
          width: 25,
          height: 25,
        )),
  ]);
}

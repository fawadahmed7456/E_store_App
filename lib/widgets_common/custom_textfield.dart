import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField(String title, String hint, controller, isPass) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    title.text.color(redColor).fontFamily(semibold).size(16).make(),
    5.heightBox,
    TextFormField(
      controller: controller,
      obscureText: isPass,
      decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
          )),
    )
  ]);
}

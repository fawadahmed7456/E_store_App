import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton(onPress, color, textColor, String title) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: onPress,
      child: title.text.color(textColor).size(16).bold.make());
}

import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/widgets.dart';

Widget bgwidget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}

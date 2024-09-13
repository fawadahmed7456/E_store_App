import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/consts/lists.dart';
import 'package:e_store_fawad/views/category_screen/category_details.dart';
import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
        ),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return Column(children: [
                    Image.asset(
                      categoriesImages1[index],
                      width: 200,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    categoriesList1[index]
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .align(TextAlign.center)
                        .make()
                  ])
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(12))
                      .make()
                      .onTap(() {
                    Get.to(() => const CategoryDetails());
                  });
                })),
      ),
    );
  }
}

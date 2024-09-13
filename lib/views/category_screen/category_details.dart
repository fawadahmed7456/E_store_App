import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/views/category_screen/item_details.dart';
import 'package:e_store_fawad/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return bgwidget(Scaffold(
      appBar: AppBar(
        title: menClothing.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    5,
                    (index) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: menClothing.text
                                      .align(TextAlign.center)
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .makeCentered()),
                            ])
                            .box
                            .rounded
                            .white
                            .size(130, 50)
                            .margin(const EdgeInsets.symmetric(horizontal: 5))
                            .make()),
              ),
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 250),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP5,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        5.heightBox,
                        "Laptop 4Gb/64Gb"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(bold)
                            .size(15)
                            .make(),
                        5.heightBox,
                        "\$600"
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(20)
                            .make(),
                      ],
                    )
                        .box
                        .rounded
                        .padding(const EdgeInsets.all(5))
                        .white
                        .shadow
                        .margin(const EdgeInsets.all(5))
                        .make()
                        .onTap(() {
                      Get.to(() => const ItemDetails(title: "Item Details"));
                    });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}

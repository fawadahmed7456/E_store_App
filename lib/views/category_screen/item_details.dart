import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/consts/lists.dart';
import 'package:e_store_fawad/widgets_common/our_button.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          5.widthBox,
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
        backgroundColor: lightGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  15.heightBox,
                  title!.text
                      .size(16)
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$30,000"
                      .text
                      .fontFamily(bold)
                      .color(redColor)
                      .size(20)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          5.heightBox,
                          "Seller"
                              .text
                              .fontFamily(bold)
                              .color(darkFontGrey)
                              .size(16)
                              .make(),
                          5.heightBox,
                          "In House Brands"
                              .text
                              .fontFamily(semibold)
                              .color(fontGrey)
                              .size(16)
                              .make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60)
                      .padding(const EdgeInsets.all(3))
                      .color(textfieldGrey)
                      .make(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(fontGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 6))
                                    .make()),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.padding(const EdgeInsets.all(3)).shadowSm.make(),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Quantity ".text.color(fontGrey).make(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              "0"
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ],
                          ).box.white.rounded.width(170).make(),
                          20.widthBox,
                          "0 Avaiable"
                              .text
                              .size(16)
                              .color(fontGrey)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total".text.color(fontGrey).make(),
                          ),
                          20.widthBox,
                          "\$0.00"
                              .text
                              .size(22)
                              .color(redColor)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ),
                  0.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          "Description: "
                              .text
                              .size(20)
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                        ],
                      ),
                      5.heightBox,
                      Row(
                        children: [
                          "This is the demo description: "
                              .text
                              .size(15)
                              .color(darkFontGrey)
                              .make(),
                        ],
                      ),
                      5.heightBox,
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(
                            itemsDetailsButtonList.length,
                            (index) => ListTile(
                                  title: itemsDetailsButtonList[index]
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  trailing: const Icon(Icons.arrow_forward),
                                )),
                      ),
                      5.heightBox,
                      productsYouMayLike.text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkFontGrey)
                          .align(TextAlign.left)
                          .make(),
                      5.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      5.heightBox,
                                      "Laptop 4Gb/64Gb"
                                          .text
                                          .color(darkFontGrey)
                                          .fontFamily(bold)
                                          .size(10)
                                          .make(),
                                      5.heightBox,
                                      "\$600"
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .size(13)
                                          .make(),
                                    ],
                                  )
                                      .box
                                      .roundedSM
                                      .width(130)
                                      .padding(const EdgeInsets.all(10))
                                      .white
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 3))
                                      .make()),
                        ),
                      )
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(6))
                      .shadow
                      .make()
                ],
              )),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ourButton(() {}, redColor, whiteColor, "Add to Cart"),
          )
        ],
      ),
    );
  }
}

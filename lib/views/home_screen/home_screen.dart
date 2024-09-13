import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/consts/lists.dart';
import 'package:e_store_fawad/views/home_screen/components/featured_buttton.dart';
import 'package:e_store_fawad/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 70,
              padding: const EdgeInsets.all(12),
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnything,
                    hintStyle: TextStyle(color: textfieldGrey)),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    itemCount: sliderList.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make();
                    },
                  ),
                  12.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButton(
                            context.screenWidth * 0.44,
                            context.screenHeight / 7,
                            index == 0 ? icTodaysDeal : icFlashDeal,
                            index == 0 ? todaysDeal : flashsale,
                            () {})),
                  ),
                  10.heightBox,
                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    itemCount: sliderList2.length,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        sliderList2[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 5))
                          .make();
                    },
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                            context.screenWidth * 0.3,
                            context.screenHeight / 7,
                            index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            index == 0
                                ? topCategories
                                : index == 1
                                    ? brand
                                    : topSellers,
                            () {})),
                  ),
                  Column(
                    children: [
                      7.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            featuredCategories.text
                                .color(fontGrey)
                                .size(20)
                                .fontFamily(bold)
                                .make()
                          ]),
                      5.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featuredButton(featuresImages1[index],
                                          featuresTitles1[index]),
                                      5.heightBox,
                                      featuredButton(featuresImages2[index],
                                          featuresTitles2[index]),
                                    ],
                                  )),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(color: redColor),
                        padding: const EdgeInsets.all(10),
                        width: context.screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredProduct.text.white
                                .fontFamily(bold)
                                .size(22)
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
                        ),
                      ),
                      10.heightBox,
                      VxSwiper.builder(
                          itemCount: 4,
                          height: 150,
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          itemBuilder: (context, index) {
                            return Image.asset(
                              sliderList2[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make();
                          }),
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 6,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisExtent: 300),
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP5,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.fill,
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
                                  .margin(const EdgeInsets.all(5))
                                  .make();
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

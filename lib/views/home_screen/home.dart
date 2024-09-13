import 'package:e_store_fawad/consts/consts.dart';
import 'package:e_store_fawad/controllers/home_controller.dart';
import 'package:e_store_fawad/views/cart_screen/cart_screen.dart';
import 'package:e_store_fawad/views/category_screen/category_screen.dart';
import 'package:e_store_fawad/views/home_screen/home_screen.dart';
import 'package:e_store_fawad/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());
  var naviBar = [
    BottomNavigationBarItem(icon: Image.asset(icHome, width: 25), label: home),
    BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 25), label: categories),
    BottomNavigationBarItem(icon: Image.asset(icCart, width: 25), label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 25), label: account),
  ];
  var naviBody = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: naviBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          items: naviBar,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          selectedItemColor: Vx.blue500,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

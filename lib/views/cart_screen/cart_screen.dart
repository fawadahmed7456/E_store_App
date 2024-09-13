import 'package:e_store_fawad/consts/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: "Cart is Empty for now!".text.white.size(25).makeCentered(),
    );
  }
}

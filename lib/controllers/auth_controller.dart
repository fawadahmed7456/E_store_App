import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_fawad/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //login method
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;
  Future<UserCredential?> loginMethod(context) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  Future<UserCredential?> signUpMethod(email, password, context) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  //data store method

  storeUserData(name, pasword, email) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': pasword,
      'email': email,
      'imageUrl': "",
      'id': currentUser!.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishList_count': "00",
    });
  }

  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}

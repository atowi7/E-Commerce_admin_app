import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/auth/login_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseLoginController extends GetxController {
  login();
  signInWithGoogle();
  openSignUp();
  openForgerPassword();
}

class LoginController extends BaseLoginController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController pass;

  bool isPassHidden = true;

  LoginData loginData = LoginData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  AppServices appServices = Get.find();

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();

    super.onInit();
  }

  showPassword() {
    isPassHidden == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, pass.text);

      statusRequest = handleData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['admin_approval'] == '1') {
            appServices.sharedPreferences
                .setString('adminid', response['data']['admin_id']);
            appServices.sharedPreferences
                .setString('adminname', response['data']['admin_name']);
            appServices.sharedPreferences
                .setString('adminimage', response['data']['admin_image']);

            appServices.sharedPreferences.setString('page', 'h');

            FirebaseMessaging.instance.subscribeToTopic('admins');

            Get.offNamed(AppRoute.homePage);
          } else {
            Get.offNamed(AppRoute.signupVerfication, arguments: {
              'email': email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: '88'.tr,
              middleText: '133'.tr);
          //statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
      }
    } else {
      // Get.defaultDialog(title: 'ERROR', middleText: 'VALIDATION ERROR');
    }
    update();
  }

  @override
  signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final admin = userCredential.user;

      appServices.sharedPreferences.setString('adminid', admin!.uid);
      appServices.sharedPreferences.setString('adminname', admin.displayName!);
      appServices.sharedPreferences.setString('adminnimage', admin.photoURL!);
      appServices.sharedPreferences.setString('page', 'h');

      FirebaseMessaging.instance.subscribeToTopic('admins');

      Get.offNamed(AppRoute.homePage);

      // print(user);
    } catch (e) {
      Get.defaultDialog(title: '88'.tr, middleText: '89'.tr);
      statusRequest = StatusRequest.serverFailure;
    }
  }

  @override
  openSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  openForgerPassword() {
    Get.offNamed(AppRoute.checkemail);
  }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
}

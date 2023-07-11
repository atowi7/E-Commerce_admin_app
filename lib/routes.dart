import 'package:ecommerce_admin_app/core/middleware/firstmiddlewares.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/view/screen/auth/login_screen.dart';
import 'package:ecommerce_admin_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_admin_app/view/screen/auth/signup_verfication_screen.dart';
import 'package:ecommerce_admin_app/view/screen/auth/sucesssignupscreen.dart';
import 'package:ecommerce_admin_app/view/screen/categorie/add.dart';
import 'package:ecommerce_admin_app/view/screen/categorie/edit.dart';
import 'package:ecommerce_admin_app/view/screen/categorie/view.dart';
import 'package:ecommerce_admin_app/view/screen/home_screen.dart';
import 'package:ecommerce_admin_app/view/screen/language_screen.dart';
import 'package:ecommerce_admin_app/view/screen/message_screen.dart';
import 'package:ecommerce_admin_app/view/screen/notification_screen.dart';
import 'package:ecommerce_admin_app/view/screen/orders/ordersarchive.dart';
import 'package:ecommerce_admin_app/view/screen/orders/ordersdetails.dart';
import 'package:ecommerce_admin_app/view/screen/orders/ordershome.dart';
import 'package:ecommerce_admin_app/view/screen/product/add.dart';
import 'package:ecommerce_admin_app/view/screen/product/edit.dart';
import 'package:ecommerce_admin_app/view/screen/product/view.dart';
import 'package:ecommerce_admin_app/view/screen/user/add.dart';
import 'package:ecommerce_admin_app/view/screen/user/edit.dart';
import 'package:ecommerce_admin_app/view/screen/user/view.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const LanguageScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LoginScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.signup,
    page: () => const SignupScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.signupVerfication,
    page: () => const SignupVerficationScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.successSignup,
    page: () => const SucessSignupScreen(),
    middlewares: [
      FirstMiddleware(),
    ],
  ),
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.userView,
    page: () => const UserView(),
  ),
  GetPage(
    name: AppRoute.userAdd,
    page: () => const UserAdd(),
  ),
  GetPage(
    name: AppRoute.userEdit,
    page: () => const UserEdit(),
  ),
  GetPage(
    name: AppRoute.categorieView,
    page: () => const CategorieView(),
  ),
  GetPage(
    name: AppRoute.categorieAdd,
    page: () => const CategorieAdd(),
  ),
  GetPage(
    name: AppRoute.categorieEdit,
    page: () => const CategorieEdit(),
  ),
  GetPage(
    name: AppRoute.productView,
    page: () => const ProductView(),
  ),
  GetPage(
    name: AppRoute.productAdd,
    page: () => const ProductAdd(),
  ),
  GetPage(
    name: AppRoute.productEdit,
    page: () => const ProductEdit(),
  ),
  GetPage(
    name: AppRoute.ordersHome,
    page: () => const OrdersHomeScreen(),
  ),
  GetPage(
    name: AppRoute.ordersDetails,
    page: () => const OrderDetailsScreen(),
  ),
  GetPage(
    name: AppRoute.ordersArchive,
    page: () => const OrdersArchiveScreen(),
  ),
  GetPage(
    name: AppRoute.notification,
    page: () => const NotificationScreen(),
  ),
  GetPage(
    name: AppRoute.message,
    page: () => const MessageScreen(),
  ),
];

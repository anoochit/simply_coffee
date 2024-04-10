// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:get/get.dart';
import '../controllers/app_controller.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: _Paths.ORDER,
      // read table parameters from uri => /order?table=A12
      page: () {
        String tableNo = Get.parameters['table'] as String;
        log('route table no = $tableNo');
        AppController appController = Get.find<AppController>();
        appController.tableNo.value = tableNo;
        return const OrderView();
      },
      bindings: [
        OrderBinding(),
      ],
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      bindings: [
        CartBinding(),
      ],
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      bindings: [
        CheckoutBinding(),
      ],
    ),
  ];
}

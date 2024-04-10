import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:get/get.dart';
import 'package:simplycoffee/config.dart';

import '../../../controllers/app_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/order_menu_view.dart';

class OrderBodyView extends GetView {
  const OrderBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderMenuView(
          icon: Icons.delivery_dining,
          title: 'Order to delivery',
          onTap: () {
            // open order screen
          },
        ),
        OrderMenuView(
          icon: Icons.dining,
          title: 'Order to table',
          onTap: () async {
            // open qrcode scan to scan qrcode then goto order screen
            final applinks = await FlutterBarcodeScanner.scanBarcode(
              '#FF0000',
              'Cancel',
              true,
              ScanMode.QR,
            );

            if (applinks.contains(APP_LINK)) {
              final tableNo = applinks.split('table=').last;
              log('table no => $tableNo');

              AppController appController = Get.find<AppController>();
              appController.tableNo.value = tableNo;

              // goto order screen
              Get.toNamed('${Routes.ORDER}?table=$tableNo');
            }
          },
        )
      ],
    );
  }
}

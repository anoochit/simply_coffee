import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../data/mock_data.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/theme.dart';

class OrderView extends GetView<AppController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        centerTitle: true,
      ),
      // show product
      body: GridView.builder(
        itemCount: listProduct.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final product = listProduct[index];
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {
                // add product to order list
                controller.addToOrder(product: product);
              },
              child: Stack(
                children: [
                  Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        product.title,
                        style: productTitleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 64,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Table ${controller.tableNo.value}'),
              FilledButton(
                onPressed: () {
                  // order list
                  Get.toNamed(Routes.CART);
                },
                child: Text('${controller.orderTotalItem} items'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

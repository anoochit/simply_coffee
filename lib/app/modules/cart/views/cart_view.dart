import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simplycoffee/app/controllers/app_controller.dart';

import '../../../routes/app_pages.dart';

class CartView extends GetView<AppController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      //  show order items, user can adjust a quantity of each items
      body: GetBuilder<AppController>(
        id: 'cart',
        builder: (controller) => ListView.builder(
          itemCount: controller.orderItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Row(
                children: [
                  // product item
                  Text(controller.orderItems[index].title),
                  const Spacer(),
                  // decrease button
                  IconButton.filledTonal(
                    onPressed: () {
                      // decrease item
                      controller.decreaseQuantity(
                        id: controller.orderItems[index].id,
                      );
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  // quantity
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('${controller.orderItems[index].qt}'),
                  ),
                  // increase button
                  IconButton.filledTonal(
                    onPressed: () {
                      // increase item
                      controller.increaseQuantity(
                        id: controller.orderItems[index].id,
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: () {
            // to checkout screen
            Get.toNamed(Routes.CHECKOUT);
          },
          child: Obx(() => Text('Checkout ${controller.orderTotalPrice} THB')),
        ),
      ),
    );
  }
}

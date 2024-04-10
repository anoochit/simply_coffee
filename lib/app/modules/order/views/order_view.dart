import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../data/mock_data.dart';
import '../../../routes/app_pages.dart';

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
          return Card(
            child: InkWell(
              onTap: () {
                // add product to order list
                controller.addToOrder(product: listProduct[index]);
              },
              child: GridTile(
                footer: Text('${listProduct[index].price}'),
                child: Text(listProduct[index].title),
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

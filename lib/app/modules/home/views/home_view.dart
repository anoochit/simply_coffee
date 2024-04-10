import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'account_body_view.dart';
import 'feed_body_view.dart';
import 'inbox_body_view.dart';
import 'order_body_view.dart';
import 'promotion_body_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.navIdex.value,
          children: const [
            FeedBodyView(),
            PromotionBodyView(),
            OrderBodyView(),
            InboxBodyView(),
            AccountBodyView()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.navIdex.value,
          onDestinationSelected: (value) => controller.navIdex.value = value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Promotions',
            ),
            NavigationDestination(
              icon: Icon(Icons.delivery_dining),
              label: 'Order',
            ),
            NavigationDestination(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

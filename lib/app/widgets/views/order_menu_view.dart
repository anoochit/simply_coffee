import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderMenuView extends GetView {
  const OrderMenuView(
      {super.key, required this.title, required this.onTap, required this.icon});

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () => onTap(),
      ),
    );
  }
}

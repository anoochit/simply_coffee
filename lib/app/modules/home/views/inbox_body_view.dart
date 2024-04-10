import 'package:flutter/material.dart';

import 'package:get/get.dart';

class InboxBodyView extends GetView {
  const InboxBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'InboxBodyView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

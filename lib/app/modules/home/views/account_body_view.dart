import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AccountBodyView extends GetView {
  const AccountBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'AccountBodyView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

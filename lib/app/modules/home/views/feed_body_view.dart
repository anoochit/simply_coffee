import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeedBodyView extends GetView {
  const FeedBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'FeedBodyView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

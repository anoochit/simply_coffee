import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/bindings/root_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Simply Coffee",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: RootBinding(),
    ),
  );
}

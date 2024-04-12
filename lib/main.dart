import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simplycoffee/app/theme/theme.dart';
import 'app/bindings/root_binding.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Simply Coffee",
      theme: ThemeData(
        colorSchemeSeed: colorSchemeSeed,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: RootBinding(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:webapp/app/modules/basket/controllers/basket_controller.dart';
import 'package:webapp/app/routes/app_pages.dart';

void main() {
  Get.put(BasketController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.COUNTER,
      getPages: AppPages.routes,
    );
  }
}

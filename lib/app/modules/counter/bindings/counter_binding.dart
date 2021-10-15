import 'package:get/get.dart';
import 'package:webapp/app/modules/counter/controllers/counter_controller.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}

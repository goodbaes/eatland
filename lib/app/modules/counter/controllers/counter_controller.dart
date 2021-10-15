import 'package:get/get.dart';

class CounterController extends GetxController {
  setIndex(i) {
    index.value = i;
  }

  final index = 0.obs;
}

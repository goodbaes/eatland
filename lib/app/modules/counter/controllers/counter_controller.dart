import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController to = Get.find();
  setIndex(i) {
    index.value = i;
  }

  WidthSize getSize() {
    double w = Get.width;
    return w < 600
        ? WidthSize.phone
        : w < 1300
            ? WidthSize.tablet
            : w < 2000
                ? WidthSize.desktop
                : WidthSize.desktop;
  }

  final index = 0.obs;
}

enum WidthSize { phone, tablet, desktop }

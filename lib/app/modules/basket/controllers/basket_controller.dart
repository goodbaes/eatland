import 'package:get/get.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';

class BasketController extends GetxController {
  static BasketController get to => Get.find();
  final basketList = RxList<BasketItem>([]);

  bool isInBasket(name) {
    List<String> names = [];
    basketList.forEach((element) {
      names.add(element.getName);
    });

    return names.contains(name);
  }

  void addToBasket(FoodItem foodItem) {
    if (isInBasket(foodItem.name)) {
      basketList.removeWhere((element) => element.getName == foodItem.name);
    } else {
      basketList.add(BasketItem(foodItem, 1));
    }
  }
}

class BasketItem {
  BasketItem(this.food, this.quantity);

  final FoodItem food;
  int quantity;
  String get getName => food.name;
}

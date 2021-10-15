import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/widgets/loading/food_loading.dart';

const String imgUrlTest = "assets/images/food.png";
const String imgUrlP = "assets/images/meat.png";
const String imgUrlM = "assets/images/meat.png";

void showDialogTemp() {
  Get.defaultDialog(
      content: const SizedBox.square(
          dimension: 300,
          child: ColoredBox(color: Colors.white, child: FoodLoading())));
}

class HomeController extends GetxController {
  final isLoading = true.obs;

  final currentCategory = 0.obs;
  void setCurrentCategory(int index) {
    currentCategory.value = index;
    getFoodList(1);
  }

  void openFilter() {
    showDialogTemp();
  }

  void openSearch() {
    showDialogTemp();
  }

  void getFoodList(i) {
    isLoading.value = true;
    Future.delayed(Duration(seconds: i), () {
      isLoading.value = false;
    });
  }

  CategoryItem get currentCategoryItem => categoryList[currentCategory.value];
  List<CategoryItem> categoryList = [
    CategoryItem('All food', '🍝'),
    CategoryItem('Meet', '🍖'),
    CategoryItem('Pizza', '🍕'),
    CategoryItem('Hot Dog', '🌭'),
    CategoryItem('Salat', '🥗'),
    CategoryItem('Desert', '🍰'),
  ];

  List<FoodItem> foodList = [
    FoodItem('Super burger', imgUrlTest, '24.4',
        'Add an assets subsection to the flutter section like this r section like this: r section like this:'),
    FoodItem('Tasty festy', imgUrlP, '44',
        'asAdd an assets subsection to the flutter section like this:d'),
    FoodItem('Nichosibe', imgUrlM, '11.4',
        'Add an assets subsection to the flutter section like this:'),
    FoodItem('BaesWoodo', imgUrlP, '5.5',
        'Add an assets subsection to the flutter section like this:'),
    FoodItem('GoTOo', imgUrlTest, '5',
        'Add an assets subsection to the flutter section like this:'),
    FoodItem('Monsta', imgUrlTest, '13',
        'Add an assets subsection to the flutter section like this:'),
    FoodItem('XXLMeat', imgUrlTest, '14',
        'aAdd an assets subsection to the flutter section like this:sd'),
    FoodItem('LoveSalat', imgUrlTest, '11',
        'Add an assets subsection to the flutter section like thissubsection to the fluttersubsection to the flutter'),
  ];

  @override
  void onReady() {
    getFoodList(8);
    super.onReady();
  }
}

class CategoryItem {
  String name;
  String image;
  CategoryItem(this.name, this.image);
}

class FoodItem {
  FoodItem(this.name, this.image, this.price, this.description);

  String name;
  String image;
  String description;
  String price;
}

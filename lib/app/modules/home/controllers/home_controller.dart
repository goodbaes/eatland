import 'package:get/get.dart';

const String imgUrlTest = "assets/images/food.png";
const String imgUrlP = "assets/images/meat.png";
const String imgUrlM = "assets/images/meat.png";

class HomeController extends GetxController {
  final currentCategory = 0.obs;
  void setCurrentCategory(int index) {
    currentCategory.value = index;
    update();
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

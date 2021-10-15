import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:webapp/app/modules/basket/controllers/basket_controller.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';
import 'package:webapp/widgets/burger_menu/nav_button.dart';
import 'package:webapp/widgets/category_widget.dart';
import 'package:webapp/widgets/custom_inkwell.dart';
import 'package:webapp/widgets/food_item.dart';
import 'package:webapp/widgets/loading/food_loading.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: Center(
        child: Expanded(
          child: Row(
            children: [
              Flexible(
                flex: 70,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 20,
                        child: _buildTitle(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        flex: 25,
                        child: _buildCategory(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 60,
                        child: Column(
                          children: [
                            _buildFoodControll(),
                            const SizedBox(
                              height: 20,
                            ),
                            _buildFood(),
                          ],
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                width: 60,
              ),
              Flexible(
                flex: 30,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return StreamBuilder(
        stream: controller.currentCategory.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var date = controller.categoryList[index];
                var isActive = snapshot.data == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: isActive
                      ? CategoryItemWidget(date: date, isActive: true)
                      : CategoryInkWellItemWidget(
                          onTap: () => controller.setCurrentCategory(index),
                          date: date,
                        ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              itemCount: controller.categoryList.length);
        });
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 50,
          child: AutoSizeText(
            'Wellcome to EatLand  😋',
            style: AppText.h1,
          ),
        ),
        Flexible(
            flex: 50,
            child: CustomInkWell(
              onTap: () => controller.openSearch(),
              bgChild: Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  child: IconButtonMenu(
                      color: AppColors.darkColor.withOpacity(.5))),
              child: const IconButtonMenu(
                icon: Icons.search,
              ),
            )),
      ],
    );
  }

  Widget _buildFoodControll() {
    return Obx(
      () => FoodControll(
          foodcontroller: controller,
          name: controller.categoryList[controller.currentCategory.value].name),
    );
  }

  Widget _buildFood() {
    return Obx(
      () => !controller.isLoading.value
          ? Expanded(
              child: LayoutBuilder(builder: (context, c) {
                return Container(
                    width: c.maxWidth < 300
                        ? 100
                        : c.maxWidth < 600
                            ? 400
                            : c.maxWidth < 1000
                                ? 800
                                : 800,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: c.maxWidth < 300
                            ? 1
                            : c.maxWidth < 600
                                ? 2
                                : c.maxWidth < 1000
                                    ? 3
                                    : 3,
                        crossAxisSpacing: Get.width / 25,
                        // mainAxisExtent: 1,
                        mainAxisSpacing: Get.width / 25,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: controller.foodList.length,
                      itemBuilder: (context, index) {
                        var data = controller.foodList[index];
                        return FoodItemWidget(
                            data: data,
                            inBasket: BasketController.to.isInBasket(data.name),
                            onPressed: () =>
                                BasketController.to.addToBasket(data));
                      },
                    ));
              }),
            )
          : const FoodLoading(),
    );
  }
}

class FoodControll extends StatelessWidget {
  const FoodControll({
    Key? key,
    required this.foodcontroller,
    this.name = '',
  }) : super(key: key);

  final HomeController foodcontroller;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 50,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  name,
                  style: AppText.h4,
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                    onTap: () => foodcontroller.openFilter(),
                    child: const Icon(Icons.filter_list)),
              ],
            ),
          ),
        ),
        Flexible(
            flex: 50,
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'View all',
                    style: AppText.burgerMenuItemLabelinInActive,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox.square(
                    dimension: 50,
                    child: CustomInkWell(
                      child:
                          const IconButtonMenu(icon: Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

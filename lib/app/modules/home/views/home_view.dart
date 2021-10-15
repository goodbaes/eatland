import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';
import 'package:webapp/widgets/burger_menu/nav_button.dart';
import 'package:webapp/widgets/category_widget.dart';
import 'package:webapp/widgets/custom_inkwell.dart';
import 'package:webapp/widgets/food_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: Center(
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
                      flex: 20,
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
                return isActive
                    ? CategoryItemWidget(date: date, isActive: true)
                    : CategoryInkWellItemWidget(
                        onTap: () => controller.setCurrentCategory(index),
                        date: date,
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
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  controller
                      .categoryList[controller.currentCategory.value].name,
                  style: AppText.h4,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.filter_list),
              ],
            ),
          ),
          Flexible(
              flex: 50,
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
              )),
        ],
      ),
    );
  }

  Widget _buildFood() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.foodList.length,
        itemBuilder: (context, index) {
          var data = controller.foodList[index];
          return FoodItemWidget(data: data);
        },
      ),
    );
  }
}

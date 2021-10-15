import 'package:flutter/widgets.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/app_transfom.dart';
import 'package:webapp/app/resources/text_styles.dart';

import 'custom_inkwell.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.date,
    this.isActive = false,
  }) : super(key: key);

  final CategoryItem date;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkColor.withOpacity(isActive ? 0.2 : 0),
                blurRadius: 30,
                spreadRadius: 1,
                offset: const Offset(0, 15),
              ),
            ],
          ),
        ),
        Transform(
          transform: isActive ? AppTransform.hoverMatrix : Matrix4.identity(),
          child: Container(
            height: 200,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: isActive ? AppColors.lightColor : AppColors.grayColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        date.image,
                        style: AppText.h1,
                      ),
                    ),
                  ),
                  Text(date.name, style: AppText.burgerMenuItemLabelinInActive),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryInkWellItemWidget extends StatelessWidget {
  const CategoryInkWellItemWidget({
    Key? key,
    required this.date,
    this.onTap,
  }) : super(key: key);

  final CategoryItem date;

  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () => onTap?.call(),
      bgChild: Container(
        height: 200,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.darkColor.withOpacity(.5),
        ),
      ),
      child: CategoryItemWidget(date: date),
    );
  }
}

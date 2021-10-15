import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/app/modules/counter/controllers/counter_controller.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/modules/home/views/home_view.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';
import 'package:webapp/widgets/burger_menu/nav_button.dart';

class CounterView extends GetWidget<CounterController> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.bgBurgerMenu,
        body: _buildContent(),
      ),
    );
  }

  Row _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[_buildBurgerMenu(), _buildMainContent()],
    );
  }

  Expanded _buildMainContent() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 26, 26, 26),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkColor.withOpacity(.3),
                  blurRadius: 30,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: AppColors.lightColor),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 60, 60, 0),
              child: GetBuilder(
                  init: HomeController(), builder: (_) => const HomeView()))),
    ));
  }

  Column _buildBurgerMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.lightColor,
                radius: 40,
                foregroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/ru/thumb/4/4c/Neo2.jpg/274px-Neo2.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'Neo Matrix',
                style: AppText.h5,
              )
            ],
          ),
        ),
        Flexible(
          flex: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavButton(
                icon: CupertinoIcons.home,
                text: 'Home',
                isActive: controller.index.value == 0,
                onPressed: () => controller.setIndex(0),
              ),
              NavButton(
                icon: CupertinoIcons.doc_text,
                text: 'Menu',
                isActive: controller.index.value == 1,
                onPressed: () => controller.setIndex(1),
              ),
              NavButton(
                icon: CupertinoIcons.settings,
                text: 'Settings',
                isActive: controller.index.value == 2,
                onPressed: () => controller.setIndex(2),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 30,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Version 1.0.0')],
          ),
        )
      ],
    );
  }
}

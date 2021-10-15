import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    this.text = '',
    this.onPressed,
    required this.icon,
    this.isActive = true,
    Key? key,
  }) : super(key: key);
  final String text;
  final Function? onPressed;
  final bool isActive;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 5, 36, 5),
      child: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        splashColor: AppColors.activeButtonBurgerMenuBg,
        color:
            isActive ? AppColors.activeButtonBurgerMenuBg : Colors.transparent,
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        child: SizedBox(
          width: 200,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButtonMenu(
                  iconColor:
                      isActive ? AppColors.lightColor : AppColors.darkColor,
                  icon: icon,
                  color: isActive
                      ? AppColors.activeButtonBurgerMenu
                      : AppColors.lightColor),
              Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: isActive
                            ? AppText.burgerMenuItemLabelinActive
                            : AppText.burgerMenuItemLabelinInActive,
                      ))),
            ],
          ),
        ),
        onPressed: () => onPressed?.call(),
      ),
    );
  }
}

class IconButtonMenu extends StatelessWidget {
  const IconButtonMenu(
      {Key? key,
      this.icon,
      this.color = AppColors.grayColor,
      this.iconColor = AppColors.darkColor})
      : super(key: key);
  final Color color;
  final IconData? icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
        dimension: 70,
        child: FittedBox(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        )));
  }
}

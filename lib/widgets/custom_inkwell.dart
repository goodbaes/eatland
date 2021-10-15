import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/app_transfom.dart';
import 'package:webapp/widgets/burger_menu/nav_button.dart';

class CustomInkWell extends StatefulWidget {
  const CustomInkWell({
    Key? key,
    required this.child,
    this.bgChild = const IconButtonMenu(
      icon: FontAwesomeIcons.heart,
      iconColor: Colors.red,
      color: AppColors.lightColor,
    ),
    this.onTap,
    this.withAnimation = true,
  }) : super(key: key);
  final bool withAnimation;
  final Widget child;
  final Function? onTap;
  final Widget bgChild;
  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(26),
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHover: (value) {
          if (widget.withAnimation) {
            setState(() {
              _isHovering = value;
            });
          }
        },
        onTap: () {
          setState(() {
            _isHovering = false;
          });
          widget.onTap?.call();
        },
        child: Stack(
          children: [
            widget.bgChild,
            AnimatedContainer(
                curve: Curves.easeInOut,
                transform: (_isHovering
                    ? AppTransform.hoverMatrix
                    : Matrix4.identity()),
                duration: const Duration(milliseconds: 200),
                child: widget.child),
          ],
        ));
  }
}

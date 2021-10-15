import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';
import 'package:webapp/app/resources/text_styles.dart';

class FoodLoading extends StatelessWidget {
  const FoodLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 200,
          child: RiveAnimation.asset(
            'assets/animation/runner.riv',
          ),
        ),
        SizedBox(
          height: 100,
          child: DefaultTextStyle(
            style: AppText.h1,
            child: AnimatedTextKit(animatedTexts: [
              RotateAnimatedText(' Loading '),
              RotateAnimatedText(' Wait a little more '),
              RotateAnimatedText(' Finish soon '),
            ]),
          ),
        )
      ],
    );
  }
}

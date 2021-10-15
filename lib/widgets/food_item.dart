import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget(
      {Key? key, required this.data, this.inBasket = false, this.onPressed})
      : super(key: key);
  final FoodItem data;
  final bool inBasket;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Flexible(flex: 20, child: Container()),
              Flexible(
                flex: 80,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkColor.withOpacity(.5),
                        width: 1,
                      ),
                      color: AppColors.lightColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(flex: 20, child: Container()),
                          Flexible(
                            flex: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        data.name,
                                        style: AppText.bodyBold,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(
                                        data.description,
                                        style: AppText.caption,
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AutoSizeText(
                                                '\$ ' + data.price.toString(),
                                                style: AppText.bodyBold),
                                            SizedBox.square(
                                                dimension: 40,
                                                child: FloatingActionButton(
                                                  backgroundColor: Colors.black,
                                                  child: Icon(inBasket
                                                      ? Icons.check
                                                      : Icons.add),
                                                  onPressed: onPressed?.call(),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
          ImageFood(data: data),
        ],
      ),
    );
  }
}

class ImageFood extends StatelessWidget {
  const ImageFood({
    Key? key,
    required this.data,
  }) : super(key: key);

  final FoodItem data;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: Get.width / 15,
      child: Stack(
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: Offset(40, 30),
                ),
              ],
            ),
          ),
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: data.image,
          ),
        ],
      ),
    );
  }
}

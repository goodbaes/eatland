import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webapp/app/modules/home/controllers/home_controller.dart';
import 'package:webapp/app/resources/app_colors.dart';
import 'package:webapp/app/resources/text_styles.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({Key? key, required this.data}) : super(key: key);
  final FoodItem data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.darkColor.withOpacity(.5),
                    width: 1,
                  ),
                  color: AppColors.lightColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SizedBox(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 30, child: SizedBox()),
                      Flexible(
                        flex: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.name,
                                  style: AppText.bodyBold,
                                  maxLines: 1,
                                ),
                                Flexible(
                                  child: Text(
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
                                        Text('\$ ' + data.price.toString(),
                                            style: AppText.bodyBold),
                                        SizedBox.square(
                                            dimension: 40,
                                            child: FloatingActionButton(
                                              backgroundColor: Colors.black,
                                              child: Icon(Icons.add),
                                              onPressed: null,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 40,
                child: SizedBox.square(
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: data.image,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: Offset(50, 50),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Flexible(flex: 50, child: SizedBox()),
            ],
          )
        ],
      ),
    );
  }
}

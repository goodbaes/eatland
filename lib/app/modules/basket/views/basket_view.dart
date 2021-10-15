import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/basket_controller.dart';

class BasketView extends GetView<BasketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BasketView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BasketView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

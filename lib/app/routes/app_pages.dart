import 'package:get/get.dart';

import 'package:webapp/app/modules/counter/bindings/counter_binding.dart';
import 'package:webapp/app/modules/counter/views/counter_view.dart';
import 'package:webapp/app/modules/home/bindings/home_binding.dart';
import 'package:webapp/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.COUNTER;

  static final routes = [
    GetPage(
      name: _Paths.COUNTER,
      page: () => const CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

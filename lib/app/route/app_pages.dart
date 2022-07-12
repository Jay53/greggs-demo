import 'package:get/get.dart';
import 'package:greggs/app/binding/cart_binding.dart';
import 'package:greggs/app/binding/home_binding.dart';
import 'package:greggs/app/binding/product_detail_binding.dart';
import 'package:greggs/presentation/pages/cart/cart_page.dart';
import 'package:greggs/presentation/pages/home/home_page.dart';
import 'package:greggs/presentation/pages/home/product_detail_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
  ];
}

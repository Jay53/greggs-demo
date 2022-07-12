import 'package:get/get.dart';
import 'package:greggs/app/route/app_pages.dart';

class ProductDetailController extends GetxController {
  void goToCart() {
    Get.toNamed(Routes.CART);
  }
}

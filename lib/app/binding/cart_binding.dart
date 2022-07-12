import 'package:get/get.dart';
import 'package:greggs/presentation/controllers/cart_controller.dart';
import 'package:greggs/presentation/controllers/home_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}

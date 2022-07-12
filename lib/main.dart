import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greggs/data/network/api_base_helper.dart';
import 'package:greggs/data/network/api_repository.dart';
import 'package:greggs/presentation/controllers/cart_controller.dart';
import 'package:greggs/presentation/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
}

void initServices() {
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  Get.put(CartController(), permanent: true);
}

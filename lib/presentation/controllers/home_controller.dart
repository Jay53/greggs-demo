import 'package:get/get.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/app/route/app_pages.dart';
import 'package:greggs/app/utils/global.dart';
import 'package:greggs/data/models/product.dart';
import 'package:greggs/data/network/api_repository.dart';

class HomeController extends GetxController {
  final ApiRepository _apiRepository;

  HomeController(this._apiRepository);

  final products = <Product>[].obs;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }

  Future<void> _getProducts() async {
    try {
      isLoading = true;
      List<Product> list = await _apiRepository.products();
      products.assignAll(list);
    } catch (e) {
      Global.showSnackBar(AppConstants.error, e.toString());
    } finally {
      isLoading = false;
    }
  }

  void goToCart() {
    Get.toNamed(Routes.CART);
  }

  void goToProductDetail(int index) {
    Get.toNamed(Routes.PRODUCTDETAIL, arguments: {
      'product': products[index].toJson(),
    });
  }
}

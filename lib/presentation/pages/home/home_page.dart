import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greggs/app/config/app_colors.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/app/config/app_fonts.dart';
import 'package:greggs/data/models/product.dart';
import 'package:greggs/presentation/controllers/cart_controller.dart';
import 'package:greggs/presentation/controllers/home_controller.dart';
import 'package:greggs/presentation/widgets/my_button.dart';
import 'package:greggs/presentation/widgets/my_loading.dart';
import 'package:greggs/presentation/widgets/my_text.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.find();
  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: MyText(
        AppConstants.appName.toUpperCase(),
        color: AppColors.secondPrimary,
        fontSize: 16,
        fontWeight: fwBold,
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: _controller.goToCart,
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.white,
              ),
            ),
            Obx(() {
              if (_cartController.products.isEmpty) return const SizedBox();
              return Positioned(
                right: 6,
                top: 8,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColors.secondPrimary,
                  child: Center(
                    child: MyText(
                      '${_cartController.totalItem()}',
                      fontSize: 8,
                      color: AppColors.primary,
                      fontWeight: fwBold,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _getBody() {
    return Obx(() {
      if (_controller.isLoading) return const MyLoading();
      if (_controller.products.isEmpty) {
        return const Center(
          child: MyText(AppConstants.noDataFound),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        itemCount: _controller.products.length,
        itemBuilder: (context, index) {
          final Product product = _controller.products[index];
          return _getListItem(product, index);
        },
      );
    });
  }

  Widget _getListItem(Product product, int index) {
    return InkWell(
      onTap: () => _controller.goToProductDetail(index),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Image.network(
                product.thumbnailUri,
                width: 100,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        product.articleName,
                        color: AppColors.primary,
                        fontWeight: fwBold,
                        fontSize: 18,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            '${AppConstants.gbp} ${product.eatInPrice}',
                            fontSize: 16,
                          ),
                          Obx(() {
                            return MyButton(
                              onTap: _cartController.isAddedToCart(product)
                                  ? null
                                  : () => _cartController.addProduct(product),
                              isEnabled:
                                  !_cartController.isAddedToCart(product),
                              child: MyText(
                                _cartController.isAddedToCart(product)
                                    ? AppConstants.addedToCart
                                    : AppConstants.addToCart,
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: fwSemiBold,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

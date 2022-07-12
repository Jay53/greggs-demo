import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greggs/app/config/app_colors.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/app/config/app_fonts.dart';
import 'package:greggs/data/models/product.dart';
import 'package:greggs/presentation/controllers/cart_controller.dart';
import 'package:greggs/presentation/controllers/product_detail_controller.dart';
import 'package:greggs/presentation/widgets/my_button.dart';
import 'package:greggs/presentation/widgets/my_text.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  ProductDetailController get _controller => Get.find();
  final Product _product = Product.fromJson(Get.arguments['product']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Image.network(_product.imageUri),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          _product.articleName,
                          color: AppColors.primary,
                          fontWeight: fwBold,
                          fontSize: 24,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              '${AppConstants.gbp} ${_product.eatInPrice}',
                              color: AppColors.black,
                              fontWeight: fwMedium,
                              fontSize: 20,
                            ),
                            GetX<CartController>(
                              builder: (controller) {
                                return MyButton(
                                  onTap: controller.isAddedToCart(_product)
                                      ? null
                                      : () => controller.addProduct(_product),
                                  child: MyText(
                                    controller.isAddedToCart(_product)
                                        ? AppConstants.addedToCart
                                        : AppConstants.addToCart,
                                    color: AppColors.white,
                                  ),
                                  isEnabled:
                                      !controller.isAddedToCart(_product),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        MyText(
                          _product.customerDescription,
                          color: AppColors.darkGray,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      onPressed: _controller.goToCart,
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: AppColors.primary,
                      ),
                    ),
                    GetX<CartController>(builder: (controller) {
                      if (controller.products.isEmpty) return const SizedBox();
                      return Positioned(
                        right: 6,
                        top: 6,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: AppColors.secondPrimary,
                          child: Center(
                            child: MyText(
                              '${controller.totalItem()}',
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
            ),
          ),
        ],
      ),
    );
  }
}

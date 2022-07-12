import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greggs/app/config/app_colors.dart';
import 'package:greggs/app/config/app_constants.dart';
import 'package:greggs/app/config/app_fonts.dart';
import 'package:greggs/data/models/product.dart';
import 'package:greggs/presentation/controllers/cart_controller.dart';
import 'package:greggs/presentation/widgets/my_button.dart';
import 'package:greggs/presentation/widgets/my_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  CartController get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButton: _getCheckoutButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: MyText(
        AppConstants.cart.toUpperCase(),
        color: AppColors.white,
        fontSize: 16,
        fontWeight: fwBold,
      ),
    );
  }

  Widget _getBody() {
    return GetX<CartController>(
      builder: (controller) {
        if (controller.products.isEmpty) {
          return const Center(
            child: MyText(AppConstants.noItemAddedToCart),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final Product product = controller.products[index];
            return _getListItem(product, index);
          },
        );
      },
    );
  }

  Widget _getListItem(Product product, int index) {
    return InkWell(
      onTap: () {},
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
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              product.articleName,
                              color: AppColors.primary,
                              fontWeight: fwBold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                          MyText(
                            '${AppConstants.gbp} ${product.totalAmount.toStringAsFixed(2)}',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _getActionIcon(
                            Icons.remove_circle,
                            onTap: () => _controller.decreaseQuantity(index),
                          ),
                          const SizedBox(width: 6),
                          MyText(
                            '${product.quantity}',
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: fwSemiBold,
                          ),
                          const SizedBox(width: 6),
                          _getActionIcon(
                            Icons.add_circle,
                            onTap: () => _controller.increaseQuantity(index),
                          ),
                          const Spacer(),
                          MyButton(
                            onTap: () => _controller.removeProduct(index),
                            isEnabled: true,
                            child: const MyText(
                              AppConstants.remove,
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ),
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

  Widget _getActionIcon(IconData iconData, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          color: AppColors.secondPrimary,
        ),
      ),
    );
  }

  Widget _getCheckoutButton() {
    return Obx(() {
      if (_controller.products.isEmpty) return const SizedBox();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 52,
          child: MyButton(
            onTap: () {},
            child: MyText(
              '${AppConstants.pay}  ${AppConstants.gbp} ${_controller.totalPayAmount().toStringAsFixed(2)}',
              color: AppColors.secondPrimary,
              fontSize: 20,
              fontWeight: fwBold,
            ),
            isEnabled: true,
          ),
        ),
      );
    });
  }
}

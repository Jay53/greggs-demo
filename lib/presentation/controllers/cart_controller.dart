import 'package:get/get.dart';
import 'package:greggs/data/models/product.dart';

class CartController extends GetxController {
  final products = <Product>[].obs;

  void addProduct(Product product) {
    products.add(product);
  }

  void increaseQuantity(int index) {
    Product product = products[index];
    Product updatedProduct = product.copyWith(
      quantity: product.quantity + 1,
    );
    products[index] = updatedProduct;
  }

  void decreaseQuantity(int index) {
    Product product = products[index];
    if (product.quantity > 1) {
      Product updatedProduct = product.copyWith(
        quantity: product.quantity - 1,
      );
      products[index] = updatedProduct;
    }
  }

  void removeProduct(int index) {
    products.removeAt(index);
  }

  bool isAddedToCart(Product product) {
    Product? prod =
        products.firstWhereOrNull((e) => e.articleCode == product.articleCode);
    return prod != null;
  }

  int totalItem() {
    int count = 0;
    for (var element in products) {
      count += element.quantity;
    }
    return count;
  }

  double totalPayAmount() {
    double amount = 0;
    for (var e in products) {
      amount += e.totalAmount;
    }
    return amount;
  }
}

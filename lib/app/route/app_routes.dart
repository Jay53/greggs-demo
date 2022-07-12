part of 'app_pages.dart';

class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const CART = _Paths.CART;
  static const PRODUCTDETAIL = _Paths.PRODUCTDETAIL;
}

abstract class _Paths {
  static const HOME = '/home';
  static const CART = '/cart';
  static const PRODUCTDETAIL = '/product-detail';
}

import 'package:flutter/services.dart';
import 'package:greggs/app/config/app_assets.dart';
import 'package:greggs/data/models/product.dart';
import 'package:greggs/data/network/api_base_helper.dart';

class ApiRepository {
  final ApiBaseHelper _helper;

  ApiRepository(this._helper);

  Future<List<Product>> products() async {
    final String data = await rootBundle.loadString(AppAssets.data);
    return productListFromJson(data);
  }
}

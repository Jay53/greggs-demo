import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

List<Product> productListFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productListToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Product {
  final String articleCode;
  final String shopCode;
  final String availableFrom;
  final String availableUntil;
  final double eatOutPrice;
  final double eatInPrice;
  final String articleName;
  final List<String> dayParts;
  final String internalDescription;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;
  final int quantity;

  const Product({
    required this.articleCode,
    required this.shopCode,
    required this.availableFrom,
    required this.availableUntil,
    required this.eatOutPrice,
    required this.eatInPrice,
    required this.articleName,
    required this.dayParts,
    required this.internalDescription,
    required this.customerDescription,
    required this.imageUri,
    required this.thumbnailUri,
    this.quantity = 1,
  });

  Product copyWith({
    String? articleCode,
    String? shopCode,
    String? availableFrom,
    String? availableUntil,
    double? eatOutPrice,
    double? eatInPrice,
    String? articleName,
    List<String>? dayParts,
    String? internalDescription,
    String? customerDescription,
    String? imageUri,
    String? thumbnailUri,
    int? quantity,
  }) {
    return Product(
        articleCode: articleCode ?? this.articleCode,
        shopCode: shopCode ?? this.shopCode,
        availableFrom: availableFrom ?? this.availableFrom,
        availableUntil: availableUntil ?? this.availableUntil,
        eatOutPrice: eatOutPrice ?? this.eatOutPrice,
        eatInPrice: eatInPrice ?? this.eatInPrice,
        articleName: articleName ?? this.articleName,
        dayParts: dayParts ?? this.dayParts,
        internalDescription: internalDescription ?? this.internalDescription,
        customerDescription: customerDescription ?? this.customerDescription,
        imageUri: imageUri ?? this.imageUri,
        thumbnailUri: thumbnailUri ?? this.thumbnailUri,
        quantity: quantity ?? this.quantity);
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  double get totalAmount => eatInPrice * quantity;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      articleCode: json['articleCode'] as String,
      shopCode: json['shopCode'] as String,
      availableFrom: json['availableFrom'] as String,
      availableUntil: json['availableUntil'] as String,
      eatOutPrice: (json['eatOutPrice'] as num).toDouble(),
      eatInPrice: (json['eatInPrice'] as num).toDouble(),
      articleName: json['articleName'] as String,
      dayParts:
          (json['dayParts'] as List<dynamic>).map((e) => e as String).toList(),
      internalDescription: json['internalDescription'] as String,
      customerDescription: json['customerDescription'] as String,
      imageUri: json['imageUri'] as String,
      thumbnailUri: json['thumbnailUri'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'articleCode': instance.articleCode,
      'shopCode': instance.shopCode,
      'availableFrom': instance.availableFrom,
      'availableUntil': instance.availableUntil,
      'eatOutPrice': instance.eatOutPrice,
      'eatInPrice': instance.eatInPrice,
      'articleName': instance.articleName,
      'dayParts': instance.dayParts,
      'internalDescription': instance.internalDescription,
      'customerDescription': instance.customerDescription,
      'imageUri': instance.imageUri,
      'thumbnailUri': instance.thumbnailUri,
    };

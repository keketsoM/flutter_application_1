// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      productBrand: json['productBrand'] as String,
      productType: json['productType'] as String,
      productCount: json['productCount'] as int,
      warranty: json['warranty'] as String,
      boxItems: json['boxItems'] as String,
      dateCreated: json['dateCreated'] as String,
      vendorId: json['vendorId'] as int,
      vendor: json['vendor'] as String?,
      orders: json['orders'] as String?,
      productName: json['productName'] as String,
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      imageLink: json['imageLink'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      isPopular: json['isPopular'] as bool,
      isRecommmened: json['isRecommmened'] as bool,
      discount: (json['discount'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productBrand': instance.productBrand,
      'productCategory': instance.productCategory,
      'productType': instance.productType,
      'productCount': instance.productCount,
      'productDescription': instance.productDescription,
      'imageLink': instance.imageLink,
      'productPrice': instance.productPrice,
      'warranty': instance.warranty,
      'boxItems': instance.boxItems,
      'dateCreated': instance.dateCreated,
      'discount': instance.discount,
      'isPopular': instance.isPopular,
      'isRecommmened': instance.isRecommmened,
      'vendorId': instance.vendorId,
      'vendor': instance.vendor,
      'orders': instance.orders,
    };

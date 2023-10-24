import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int id;
  final String productName;
  final String productBrand;
  final String productCategory;
  final String productType;
  final int productCount;
  final String productDescription;
  final String imageLink;
  final double productPrice;
  final String warranty;
  final String boxItems;
  final String dateCreated;
  final double discount;
  final bool isPopular;
  final bool isRecommend;
  final int vendorId;
  final String? vendor;
  final String? orderItems;
  final String? cartItems;

  Product({
    required this.id,
    required this.productBrand,
    required this.productType,
    required this.productCount,
    required this.warranty,
    required this.boxItems,
    required this.dateCreated,
    required this.vendorId,
    required this.vendor,
    required this.orderItems,
    required this.productName,
    required this.productCategory,
    required this.productDescription,
    required this.imageLink,
    required this.productPrice,
    required this.isPopular,
    required this.isRecommend,
    required this.discount,
    required this.cartItems,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        productBrand,
        productType,
        productCount,
        warranty,
        boxItems,
        dateCreated,
        vendorId,
        vendor ?? "No Vendor",
        orderItems ?? "No Orders",
        productName,
        productCategory,
        productDescription,
        imageLink,
        productPrice,
        isPopular,
        isRecommend,
        discount,
        cartItems ?? "No CartItems",
      ];

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

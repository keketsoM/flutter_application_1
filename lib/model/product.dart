import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String productName;
  final String productBrand;
  final String category;
  final String productType;
  final String productCount;
  final String productDescription;
  final String imageUrl;
  final double price;
  final String warranty;
  final String boxItems;
  final DateTime dateCreated;
  final int discount;
  final bool isPopular;
  final bool isRecommended;
  final int? vendorId;
  final String vendor;
  final String orders;

  Product(
      {required this.productId,
      required this.productBrand,
      required this.productType,
      required this.productCount,
      required this.warranty,
      required this.boxItems,
      required this.dateCreated,
      required this.vendorId,
      required this.vendor,
      required this.orders,
      required this.productName,
      required this.category,
      required this.productDescription,
      required this.imageUrl,
      required this.price,
      required this.isPopular,
      required this.isRecommended,
      required this.discount});
  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
        productBrand,
        productType,
        productCount,
        warranty,
        boxItems,
        dateCreated,
        vendorId,
        vendor,
        orders,
        productName,
        category,
        productDescription,
        imageUrl,
        price,
        isPopular,
        isRecommended,
        discount
      ];
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["id"],
        productName: json["productName"],
        productBrand: json["productBrand"],
        productDescription: json["productDescription"],
        category: json["productCategory"],
        productType: json["productType"],
        productCount: json["productCount"],
        price: json["productPrice"],
        imageUrl: json["imageLink"],
        warranty: json["warranty"],
        boxItems: json["boxItems"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        vendor: json["vendor"],
        vendorId: json["vendorId"],
        orders: json["isPopular"],
        isPopular: json["orders"],
        isRecommended: json["isRecommended"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": productId,
        "productName": productName,
        "productBrand": productBrand,
        "productDescription": productDescription,
        "productCategory": category,
        "productType": productType,
        "productCount": productCount,
        "productPrice": price,
        "imageLink": imageUrl,
        "warranty": warranty,
        "boxItems": boxItems,
        "dateCreated": dateCreated.toIso8601String(),
        "vendor": vendor,
        "vendorId": vendorId,
        "orders": orders,
        "isPopular": isPopular,
        "isRecommended": isRecommended,
        "discount": discount,
      };

  static List<Product> products = [
    Product(
      category: 'Laptop',
      imageUrl:
          'https://media.takealot.com/covers_images/b0a8f3d22e714b83a309109c436d352f/s-zoom.file',
      price: 13999.0,
      isPopular: true,
      isRecommended: true,
      productDescription:
          'Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up. Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up.',
      discount: 20,
      productId: 1,
      productBrand: 'Huawei',
      productType: 'Laptop',
      productCount: '0',
      warranty: '1',
      boxItems: 'charger and laptop',
      dateCreated: DateTime.now(),
      vendorId: 1,
      vendor: 'keke',
      orders: '9',
      productName: 'Huawei Matebook\n D14',
    ),
    Product(
      category: 'Laptop',
      imageUrl:
          'https://media.takealot.com/covers_images/b0a8f3d22e714b83a309109c436d352f/s-zoom.file',
      price: 13999.0,
      isPopular: true,
      isRecommended: true,
      productDescription:
          'Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up. Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up.',
      discount: 20,
      productId: 1,
      productBrand: 'Huawei',
      productType: 'Laptop',
      productCount: '0',
      warranty: '1',
      boxItems: 'charger and laptop',
      dateCreated: DateTime.now(),
      vendorId: 1,
      vendor: 'keke',
      orders: '9',
      productName: 'Huawei Matebook\n D14',
    ),
    Product(
      category: 'Laptop',
      imageUrl:
          'https://media.takealot.com/covers_images/b0a8f3d22e714b83a309109c436d352f/s-zoom.file',
      isPopular: true,
      isRecommended: true,
      productDescription:
          'Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up. Enjoy every look of HUAWEI MateBook D 14 thanks to the IPS anti-glare 14" HUAWEI FullView Display1 and 16:9 aspect ratio. With Full-HD 1920 × 1080 resolution, every image bursts with detail and clarity. For a better viewing experience every time you open up.',
      discount: 20,
      productId: 1,
      productBrand: 'Huawei',
      productType: 'Laptop',
      productCount: '0',
      warranty: '1',
      boxItems: 'charger and laptop',
      dateCreated: DateTime.now(),
      vendorId: 1,
      vendor: 'keke',
      orders: '9',
      productName: 'Huawei Matebook\n D14',
      price: 200.0,
    )
  ];
}

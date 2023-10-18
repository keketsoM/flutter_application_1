import 'package:equatable/equatable.dart';

class Services extends Equatable {
  final int id;
  final String serviceImageUrl;
  final String serviceDescription;
  final String serviceName;
  final int vendorId;
  final String? vendor;

  Services({
    required this.id,
    required this.serviceImageUrl,
    required this.serviceDescription,
    required this.serviceName,
    required this.vendorId,
    required this.vendor,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        serviceImageUrl,
        serviceDescription,
        serviceName,
        vendorId,
        vendor ?? "No vender",
      ];

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        serviceImageUrl: json["serviceImageUrl"],
        serviceDescription: json["serviceDescription"],
        serviceName: json["serviceName"],
        vendorId: json["vendorId"],
        vendor: json["vendor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceImageUrl": serviceImageUrl,
        "serviceDescription": serviceDescription,
        "serviceName": serviceName,
        "vendorId": vendorId,
        "vendor": vendor,
      };
}

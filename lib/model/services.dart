import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'services.g.dart';

@JsonSerializable()
class Services extends Equatable {
  final int id;
  final String imageUrl;
  final String serviceDescription;
  final String serviceName;
  final int vendorId;
  final String? vendor;

  Services({
    required this.id,
    required this.imageUrl,
    required this.serviceDescription,
    required this.serviceName,
    required this.vendorId,
    required this.vendor,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imageUrl,
        serviceDescription,
        serviceName,
        vendorId,
        vendor ?? "No vender",
      ];

  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}

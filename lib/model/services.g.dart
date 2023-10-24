// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Services _$ServicesFromJson(Map<String, dynamic> json) => Services(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      serviceDescription: json['serviceDescription'] as String,
      serviceName: json['serviceName'] as String,
      vendorId: json['vendorId'] as int,
      vendor: json['vendor'] as String?,
    );

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'serviceDescription': instance.serviceDescription,
      'serviceName': instance.serviceName,
      'vendorId': instance.vendorId,
      'vendor': instance.vendor,
    };

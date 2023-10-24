// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      id: json['id'] as int,
      imgUrl: json['imgUrl'] as String,
      decription: json['decription'] as String,
      eventName: json['eventName'] as String,
      approvedToPublish: json['approvedToPublish'] as bool,
      userEmail: json['userEmail'] as String,
    );

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'decription': instance.decription,
      'eventName': instance.eventName,
      'approvedToPublish': instance.approvedToPublish,
      'userEmail': instance.userEmail,
    };

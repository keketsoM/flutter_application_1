import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events.g.dart';

@JsonSerializable()
class Events extends Equatable {
  final int id;
  final String imgUrl;
  final String decription;
  final String eventName;
  final bool approvedToPublish;
  final String userEmail;

  Events({
    required this.id,
    required this.imgUrl,
    required this.decription,
    required this.eventName,
    required this.approvedToPublish,
    required this.userEmail,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        imgUrl,
        decription,
        eventName,
        approvedToPublish,
        userEmail,
      ];

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}

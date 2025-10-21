import 'package:json_annotation/json_annotation.dart';

part 'empty_data.g.dart';

/// Empty data model for message types with no data payload
@JsonSerializable()
class EmptyData {
  EmptyData();

  factory EmptyData.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyDataToJson(this);
}

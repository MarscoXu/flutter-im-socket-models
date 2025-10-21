import 'package:json_annotation/json_annotation.dart';

part 'empty_data.g.dart';

/// 空数据模型 - 用于不需要额外数据的消息类型
@JsonSerializable()
class EmptyData {
  const EmptyData();

  factory EmptyData.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmptyDataToJson(this);

  @override
  String toString() => 'EmptyData()';
}

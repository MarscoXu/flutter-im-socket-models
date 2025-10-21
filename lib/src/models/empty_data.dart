/// 空数据模型
/// 用于不需要额外数据的消息类型
class EmptyData {
  final dynamic rawData;

  EmptyData({this.rawData});

  factory EmptyData.fromJson(dynamic json) {
    return EmptyData(rawData: json);
  }

  Map<String, dynamic> toJson() {
    return rawData is Map<String, dynamic> ? rawData : {};
  }

  @override
  String toString() => 'EmptyData(rawData: $rawData)';
}

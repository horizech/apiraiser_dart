/// ApiraiserComponentActionRequest model
class ApiraiserComponentActionRequest {
  final String action;
  final List<dynamic> data;

  const ApiraiserComponentActionRequest({
    required this.action,
    required this.data,
  });

 factory ApiraiserComponentActionRequest.fromJson(Map<String, dynamic> json) {
    return ApiraiserComponentActionRequest(
      action: json['Action'] as String,
      data: List<dynamic>.from(json['Data'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Action': action,
      'Data': data,
    };
  }
}

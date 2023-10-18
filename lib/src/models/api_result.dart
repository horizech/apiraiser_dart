/// APIResult model
class APIResult {
  final bool success;
  final String? message;
  final dynamic data;
  final String? errorCode;

  /// Constructor
  const APIResult({
    this.success = false,
    this.message,
    this.data,
    this.errorCode,
  });

  /// Get an empty APIResult model instance
  static APIResult empty() {
    return const APIResult();
  }

  /// Get model from Json
  factory APIResult.fromJson(Map<String, dynamic> json) {
    try {
      APIResult apiResult = APIResult(
        success: json['Success'] as bool,
        message: json['Message'] != null ? json['Message'] as String : "",
        data: json['Data'],
        errorCode: json['ErrorCode'] as String?,
      );
      return apiResult;
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(APIResult instance) => <String, dynamic>{
        'Success': instance.success,
        'Message': instance.message,
        'Data': instance.data,
        'ErrorCode': instance.errorCode,
      };
}

/// Model used for making email request
class EmailRequest {
  final String? senderEmail;
  final String? senderName;
  final List<String> receivers;
  final List<String>? cc;
  final List<String>? bcc;
  final String? subject;
  final String? body;

  /// Constructor
  const EmailRequest({
    this.senderEmail,
    this.senderName,
    this.cc,
    this.bcc,
    this.body,
    this.subject,
    required this.receivers,
  });

  /// Get model from Json
  factory EmailRequest.fromJson(Map<String, dynamic> json) {
    try {
      EmailRequest loginRequest = EmailRequest(
        senderEmail: json['SenderEmail'] as String?,
        senderName: json['SenderName'] as String?,
        body: json['Body'] as String?,
        subject: json['Subject'] as String?,
        bcc: json['Bcc'] as List<String>?,
        cc: json['Cc'] as List<String>?,
        receivers: json['Receivers'] as List<String>,
      );
      return loginRequest;
    } catch (e) {
      rethrow;
    }
  }

  /// Get Json from model
  Map<String, dynamic> toJson(EmailRequest instance) {
    return <String, dynamic>{
      'SenderEmail': instance.senderEmail,
      'SenderName': instance.senderName,
      'Receivers': instance.receivers,
      'Body': instance.body,
      'Subject': instance.subject,
      'Cc': instance.cc,
      'Bcc': instance.bcc,
    };
  }
}

/// Model used for making email requests
class EmailRequest {
  final String? senderName;
  final String? senderEmail;
  final List<String> receivers;
  final List<String>? cc;
  final List<String>? bcc;
  final String? body;
  final String? subject;

  EmailRequest({
    this.senderName,
    this.senderEmail,
    required this.receivers,
    this.cc,
    this.bcc,
    this.body,
    this.subject,
  });

  /// Convert a JSON map to an EmailRequest instance
  factory EmailRequest.fromJson(Map<String, dynamic> json) {
    return EmailRequest(
      senderName: json['senderName'] as String?,
      senderEmail: json['senderEmail'] as String?,
      receivers: List<String>.from(json['receivers'] ?? []),
      cc: json['cc'] != null ? List<String>.from(json['cc']) : null,
      bcc: json['bcc'] != null ? List<String>.from(json['bcc']) : null,
      body: json['body'] as String?,
      subject: json['subject'] as String?,
    );
  }

  /// Convert an EmailRequest instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'senderEmail': senderEmail,
      'receivers': receivers,
      'cc': cc,
      'bcc': bcc,
      'body': body,
      'subject': subject,
    };
  }
}

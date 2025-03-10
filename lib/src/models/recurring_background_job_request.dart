import 'package:apiraiser/src/models/apiraiser_component_action_result.dart';

class RecurringBackgroundJobRequest {
  final ApiraiserComponentActionRequest actionRequest;
  final String jobName;
  final String cron;

  const RecurringBackgroundJobRequest({
    required this.actionRequest,
    required this.jobName,
    required this.cron,
  });

  factory RecurringBackgroundJobRequest.fromJson(Map<String, dynamic> json) {
    return RecurringBackgroundJobRequest(
      actionRequest: ApiraiserComponentActionRequest.fromJson(
          json['ActionRequest'] as Map<String, dynamic>),
      jobName: json['JobName'] as String,
      cron: json['Cron'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ActionRequest': actionRequest.toJson(),
      'JobName': jobName,
      'Cron': cron,
    };
  }
}

import 'package:apiraiser/src/models/apiraiser_component_action_result.dart';

class ScheduledBackgroundJobRequest {
  final ApiraiserComponentActionRequest actionRequest;
  final String delay;

  const ScheduledBackgroundJobRequest({
    required this.actionRequest,
    required this.delay,
  });

  factory ScheduledBackgroundJobRequest.fromJson(Map<String, dynamic> json) {
    return ScheduledBackgroundJobRequest(
      actionRequest: ApiraiserComponentActionRequest.fromJson(
          json['ActionRequest'] as Map<String, dynamic>),
      delay: json['Delay'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ActionRequest': actionRequest.toJson(),
      'Delay': delay,
    };
  }
}

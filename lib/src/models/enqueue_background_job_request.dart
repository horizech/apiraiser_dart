import 'package:apiraiser/src/models/apiraiser_component_action_result.dart';

class EnqueueBackgroundJobRequest {
  final ApiraiserComponentActionRequest actionRequest;

  const EnqueueBackgroundJobRequest({
    required this.actionRequest,
  });

  factory EnqueueBackgroundJobRequest.fromJson(Map<String, dynamic> json) {
    return EnqueueBackgroundJobRequest(
      actionRequest: ApiraiserComponentActionRequest.fromJson(
          json['ActionRequest'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'ActionRequest': actionRequest.toJson(),
    };
  }
}

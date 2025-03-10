import 'dart:convert';
import 'package:apiraiser/apiraiser.dart';
import 'package:apiraiser/constants.dart';
import 'package:apiraiser/src/helpers/rest.dart';
import 'package:apiraiser/src/models/enqueue_background_job_request.dart';
import 'package:apiraiser/src/models/recurring_background_job_request.dart';
import 'package:apiraiser/src/models/rest_params.dart';
import 'package:apiraiser/src/models/schedule_background_job_request.dart';

class BackgroundJobsProvider {
  static const String apiraiser = Constants.apiraiser;
  static const String version = Constants.version;
  static const String provider = Constants.provider;

  /// Enqueue Background Job
  Future<APIResult> enqueue(EnqueueBackgroundJobRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/BackgroundJobs/Enqueue',
          data: jsonEncode(request.toJson()),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Recurring Background Job
  Future<APIResult> recurring(RecurringBackgroundJobRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/BackgroundJobs/Recurring',
          data: jsonEncode(request.toJson()),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }

  /// Schedule Background Job
  Future<APIResult> schedule(ScheduledBackgroundJobRequest request) async {
    try {
      var res = await Rest.post(
        RestParams(
          '/$apiraiser/$version/$provider/BackgroundJobs/Schedule',
          data: jsonEncode(request.toJson()),
        ),
      );
      return APIResult.fromJson(res);
    } catch (e) {
      return APIResult(message: e.toString(), success: false);
    }
  }
}

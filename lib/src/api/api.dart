import 'package:apiraiser/src/api/apiraiser.dart';
import 'package:apiraiser/src/api/web_sockets.dart';
import 'package:apiraiser/src/apps/applications_studio.dart';
import 'package:apiraiser/src/apps/collections_studio.dart';
import 'package:apiraiser/src/apps/content_studio.dart';
import 'package:apiraiser/src/apps/media_app.dart';
import 'package:apiraiser/src/apps/notes.dart';
import 'package:apiraiser/src/apps/profile.dart';
import 'package:apiraiser/src/apps/records.dart';
import 'package:apiraiser/src/apps/tasks.dart';
import 'package:apiraiser/src/plugins/access_manager.dart';
import 'package:apiraiser/src/plugins/identity.dart';
import 'package:apiraiser/src/plugins/oauth_link.dart';
import 'package:apiraiser/src/plugins/rest_api.dart';
import 'package:apiraiser/src/plugins/ses.dart';
import 'package:apiraiser/src/plugins/smtp.dart';
import 'package:apiraiser/src/plugins/zip.dart';
import 'package:apiraiser/src/providers/archive.dart';
import 'package:apiraiser/src/api/awss3.dart';
import 'package:apiraiser/src/plugins/commerce.dart';
import 'package:apiraiser/src/providers/background_jobs.dart';
import 'package:apiraiser/src/providers/database.dart';
import 'package:apiraiser/src/providers/email.dart';
import 'package:apiraiser/src/providers/encryption.dart';
import 'package:apiraiser/src/apps/functions.dart';
import 'package:apiraiser/src/apps/importexport.dart';
import 'package:apiraiser/src/providers/media.dart';
import 'package:apiraiser/src/providers/storage.dart';
import 'package:apiraiser/src/helpers/interceptor.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/providers/authentication.dart';

/// Apiraiser class
class Apiraiser {
  static final plugin = _Plugin();

  static final provider = _Provider();

  static final app = _App();

  static final apiraiser = ApiraiserClass();

  static final webSockets = WebSockets();

  /// AWSS3 APIs
  static AWSS3 awss3 = AWSS3();

  /// Initialize the library with provided [endpoint]
  ///
  /// Loads and performs Authentication using jwt if exists
  static init(String endpoint, {Function? onUnauthenticated}) {
    State.endPoint = endpoint;
    setupDioInterceptors(onUnauthenticated);
    return true;
  }
}

class _Plugin {
  /// Zip APIs
  final zip = ZipArchivePlugin();

  /// Commerce APIs
  final commerce = CommercePlugin();

  /// OAuth Link APIs
  final oauthLink = OAuthLinkPlugin();

  /// SMTP APIs
  final smtp = SMTPEmailPlugin();

  /// SES APIs
  final ses = SESEmailPlugin();

  /// Identity APIs
  final identity = IdentityPlugin();

  /// Access Manager APIs
  final accessManager = AccessManagerPlugin();

  /// Rest API APIs
  final restAPI = RestAPIPlugin();
}

class _Provider {
  /// Archive APIs
  final archive = ArchiveProvider();

  /// Authentication APIs
  final authentication = AuthenticationProvider();

  /// Database APIs
  final database = DatabaseProvider();

  /// EmailProvider APIs
  final email = EmailProvider();

  /// Encryption APIs
  final encryption = EncryptionProvider();

  /// Media APIs
  final media = MediaProvider();

  /// Storage APIs
  final storage = StorageProvider();

  /// Background Jobs APIs
  final backgroundJobs = BackgroundJobsProvider();
}

class _App {
  /// Applications Studio App APIs
  final applicationsStudio = ApplicationsStudioApp();

  /// Collections Studio App APIs
  final collectionsStudio = CollectionsStudioApp();

  /// Content Studio App APIs
  final contentStudio = ContentStudioApp();

  /// Functions App APIs
  final functions = FunctionsApp();

  /// ImportExport App APIs
  final importExport = ImportExport();

  /// Media App APIs
  final media = MediaApp();

  /// Notes App APIs
  final notes = NotesApp();

  /// Profile App APIs
  final profile = ProfileApp();

  /// Records App APIs
  final records = RecordsApp();

  /// Task App APIs
  final tasks = TaskApp();
}

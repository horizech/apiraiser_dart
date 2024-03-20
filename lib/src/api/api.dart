import 'package:apiraiser/src/api/archive.dart';
import 'package:apiraiser/src/api/awss3.dart';
import 'package:apiraiser/src/api/commerce.dart';
import 'package:apiraiser/src/api/encryption.dart';
import 'package:apiraiser/src/api/features.dart';
import 'package:apiraiser/src/api/functions.dart';
import 'package:apiraiser/src/api/importexport.dart';
import 'package:apiraiser/src/api/initalization.dart';
import 'package:apiraiser/src/api/media.dart';
import 'package:apiraiser/src/api/miscellaneous.dart';
import 'package:apiraiser/src/api/oauth2.dart';
import 'package:apiraiser/src/api/smtp.dart';
import 'package:apiraiser/src/api/storage.dart';
import 'package:apiraiser/src/api/table.dart';
import 'package:apiraiser/src/helpers/interceptor.dart';
import 'package:apiraiser/src/helpers/state.dart';
import 'package:apiraiser/src/api/column.dart';
import 'package:apiraiser/src/api/data.dart';
import 'package:apiraiser/src/api/authentication.dart';
import 'package:apiraiser/src/api/users.dart';

/// Apiraiser class
class Apiraiser {
  /// Authentication APIs
  static Authentication authentication = Authentication();

  /// Column APIs
  static Column column = Column();

  /// Data APIs
  static Data data = Data();

  /// Function APIs
  static Functions function = Functions();

  /// Initialization APIs
  static Initialization initialization = Initialization();

  /// Miscellaneous APIs
  static Miscellaneous miscellaneous = Miscellaneous();

  /// Table APIs
  static Table table = Table();

  /// Users APIs
  static Users users = Users();

  /// Media APIs
  static Media media = Media();

  /// ImportExport APIs
  static ImportExport importExport = ImportExport();

  /// Feature APIs
  static Feature feature = Feature();

  /// Storage APIs
  static Storage storage = Storage();

  /// OAuth2 APIs
  static OAuth2 oAuth2 = OAuth2();

  /// Encryption APIs
  static Encryption encryption = Encryption();

  /// Commerce APIs
  static Commerce commerce = Commerce();

  /// Archive APIs
  static Archive archive = Archive();

  /// AWSS3 APIs
  static AWSS3 awss3 = AWSS3();

  /// SMTP APIs
  static SMTP smtp = SMTP();

  /// Initialize the library with provided [endpoint]
  ///
  /// Loads and performs Authentication using jwt if exists
  static init(String endpoint, {Function? onUnauthenticated}) {
    State.endPoint = endpoint;
    setupDioInterceptors(onUnauthenticated);
    return true;
  }
}

import 'package:apiraiser/src/api/functions.dart';
import 'package:apiraiser/src/api/importexport.dart';
import 'package:apiraiser/src/api/initalization.dart';
import 'package:apiraiser/src/api/media.dart';
import 'package:apiraiser/src/api/miscellaneous.dart';
import 'package:apiraiser/src/api/storage.dart';
import 'package:apiraiser/src/api/table.dart';
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

  /// Storage APIs
  static Storage storage = Storage();

  /// Token Validation
  static void validateAuthentication() {
    // if (token == null || token!.isEmpty) {
    //   throw ("Unauthorized!");
    // }
  }

  /// Initialize the library with provided [endpoint]
  ///
  /// Loads and performs Authentication using jwt if exists
  static init(String endpoint) async {
    State.endPoint = endpoint;
    await authentication.loadLastSession();
  }
}

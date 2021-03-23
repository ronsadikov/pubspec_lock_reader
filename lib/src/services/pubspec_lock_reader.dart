import 'package:universal_io/io.dart';

import '../models/pubspec_lock.dart';

/// Reads `pubspec.lock` from main directory and creates [PubspecLock]
PubspecLock getPubspecLock() {
  try {
    final fileContent = File('pubspec.lock').readAsStringSync();
    return PubspecLock(fileContent);
  } on FileSystemException catch (_) {
    return PubspecLock('');
  }
}

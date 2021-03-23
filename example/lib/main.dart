import 'package:pubspec_lock_reader/pubspec_lock_reader.dart';

void main() {
  /// Remember to go into example dir in your console.
  /// Run `dart lib/main.dart`
  final pubspecLock = getPubspecLock();
  final pubspecLockReader = pubspecLock.packages
      .firstWhere((element) => element.package == 'pubspec_lock_reader');
  print('show pubspec_lock_reader version');
  print(pubspecLockReader.version);
}

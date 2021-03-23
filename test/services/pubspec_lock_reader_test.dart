import 'package:pubspec_lock_reader/src/services/pubspec_lock_reader.dart';
import 'package:test/test.dart';

/// Tests [getPubspecLock()]
void main() {
  group('getPubspecLock()', () {
    test('Read packages', () {
      final pubspecLock = getPubspecLock();
      expect(pubspecLock.packages, hasLength(greaterThan(0)));
    });
  });
}

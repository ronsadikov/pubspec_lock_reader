import 'package:pubspec_lock_reader/src/models/enums/dependency_type.dart';
import 'package:test/test.dart';

/// Tests [DependencyType]

Future main() async {
  group('[Models/Enums] DependencyType', () {
    test('Values count', () async {
      expect(DependencyType.values.length, equals(4));
    });

    test('DependencyType.root', () async {
      expect(DependencyType.root.toString(), equals('DependencyType.root'));
    });

    test('DependencyType.direct', () async {
      expect(DependencyType.direct.toString(), equals('DependencyType.direct'));
    });

    test('DependencyType.development', () async {
      expect(DependencyType.development.toString(),
          equals('DependencyType.development'));
    });

    test('DependencyType.transitive', () async {
      expect(DependencyType.transitive.toString(),
          equals('DependencyType.transitive'));
    });
  });

  group('dependencyTypeFromString', () {
    test('direct main', () {
      expect(dependencyTypeFromString('direct main'), DependencyType.direct);
    });

    test('direct dev', () {
      expect(
          dependencyTypeFromString('direct dev'), DependencyType.development);
    });

    test('transitive', () {
      expect(dependencyTypeFromString('transitive'), DependencyType.transitive);
    });

    test('root', () {
      expect(dependencyTypeFromString('root'), DependencyType.root);
    });
  });
}

import 'package:pubspec_lock_reader/src/models/enums/dependency_type.dart';
import 'package:pubspec_lock_reader/src/models/package_dependency.dart';
import 'package:test/test.dart';

/// Tests [PackageDependency]

Future main() async {
  group('[Models] SdkPackageDependency', () {
    test('Values read/write', () async {
      final package = SdkPackageDependency(
        description: 'test_package_description',
        package: 'test_package',
        type: DependencyType.transitive,
        version: '1.0.0',
      );

      expect(package.description, 'test_package_description');
      expect(package.package, 'test_package');
      expect(package.type, DependencyType.transitive);
      expect(package.version, '1.0.0');
    });
  });

  group('[Models] HostedPackageDependency', () {
    test('Values read/write', () async {
      final package = HostedPackageDependency(
        package: 'test_package',
        type: DependencyType.transitive,
        version: '1.0.0',
        name: 'test_package_name',
        url: 'test_package_url',
      );

      expect(package.package, 'test_package');
      expect(package.type, DependencyType.transitive);
      expect(package.version, '1.0.0');
      expect(package.name, 'test_package_name');
      expect(package.url, 'test_package_url');
    });
  });

  group('[Models] GitPackageDependency', () {
    test('Values read/write', () async {
      final package = GitPackageDependency(
        package: 'test_package',
        type: DependencyType.transitive,
        version: '1.0.0',
        resolvedRef: 'test_resolvedRef',
        url: 'test_url',
        ref: 'test_ref',
        path: 'test_path',
      );

      expect(package.package, 'test_package');
      expect(package.type, DependencyType.transitive);
      expect(package.version, '1.0.0');
      expect(package.resolvedRef, 'test_resolvedRef');
      expect(package.url, 'test_url');
      expect(package.ref, 'test_ref');
      expect(package.path, 'test_path');
    });
  });

  group('[Models] PathPackageDependency', () {
    test('Values read/write', () async {
      final package = PathPackageDependency(
        package: 'test_package',
        type: DependencyType.transitive,
        version: '1.0.0',
        path: 'test_path',
        relative: false,
      );

      expect(package.package, 'test_package');
      expect(package.type, DependencyType.transitive);
      expect(package.version, '1.0.0');
      expect(package.path, 'test_path');
      expect(package.relative, false);
    });
  });
}

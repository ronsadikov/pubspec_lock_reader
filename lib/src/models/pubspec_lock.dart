import 'package:yaml/yaml.dart';

import 'enums/dependency_type.dart';
import 'package_dependency.dart';

/// Normalize `pubspec.lock` content into readable object.
class PubspecLock {
  final _packages = <PackageDependency>[];
  YamlMap _content = YamlMap();

  /// Creates an instance of [PubspecLock]
  PubspecLock(String stringContent) {
    _content = loadYaml(stringContent);
    _readPackages();
  }

  void _readPackages() {
    _packagesNode.forEach((packageName, packageData) {
      var _newPackage;
      switch (packageData['source']) {
        case 'sdk':
          _newPackage = SdkPackageDependency(
            description: packageData['description'],
            package: packageName,
            type: dependencyTypeFromString(packageData['dependency']),
            version: packageData['version'],
          );
          break;
        case 'hosted':
          _newPackage = HostedPackageDependency(
            url: packageData['description']['url'],
            name: packageData['description']['name'],
            package: packageName,
            type: dependencyTypeFromString(packageData['dependency']),
            version: packageData['version'],
          );
          break;
        case 'git':
          _newPackage = GitPackageDependency(
            package: packageName,
            type: dependencyTypeFromString(packageData['dependency']),
            version: packageData['version'],
            ref: packageData['description']['ref'],
            url: packageData['description']['url'],
            path: packageData['description']['path'],
            resolvedRef: packageData['description']['resolved-ref'],
          );
          break;
        case 'path':
          _newPackage = PathPackageDependency(
            package: packageName,
            type: dependencyTypeFromString(packageData['dependency']),
            version: packageData['version'],
            path: packageData['description']['path'],
            relative: packageData['description']['relative'],
          );
          break;
      }
      if (_newPackage != null) {
        _packages.add(_newPackage);
      }
    });
  }

  YamlMap get _packagesNode => _content['packages'];

  /// Returns a list of packages.
  List<PackageDependency> get packages => _packages;
}

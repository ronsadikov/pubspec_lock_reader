import 'enums/dependency_type.dart';

/// Structure of basic package dependency
abstract class PackageDependency {
  /// Package name.
  final String package;

  /// Package version.
  final String version;

  /// Package type [DependencyType]
  final DependencyType type;

  /// Constructor of [PackageDependency]
  const PackageDependency({
    required this.package,
    required this.version,
    required this.type,
  });
}

/// Structure of SDK package dependency.
class SdkPackageDependency extends PackageDependency {
  /// `description` field
  final String description;

  /// Creates an instance of [SdkPackageDependency]
  const SdkPackageDependency({
    required String package,
    required String version,
    required DependencyType type,
    required this.description,
  }) : super(package: package, version: version, type: type);
}

/// Structure of hosted package dependency.
class HostedPackageDependency extends PackageDependency {
  /// `name` field
  final String name;

  /// `url` field
  final String url;

  /// Creates an instance of [HostedPackageDependency]
  const HostedPackageDependency({
    required String package,
    required String version,
    required DependencyType type,
    required this.name,
    required this.url,
  }) : super(package: package, version: version, type: type);
}

/// Structure of GIT package dependency.
class GitPackageDependency extends PackageDependency {
  /// `ref` field
  final String ref;

  /// `url` field
  final String url;

  /// `path` field
  final String path;

  /// `resolved-ref` field
  final String resolvedRef;

  /// Creates an instance of [GitPackageDependency]
  const GitPackageDependency({
    required String package,
    required String version,
    required DependencyType type,
    required this.ref,
    required this.url,
    required this.path,
    required this.resolvedRef,
  }) : super(package: package, version: version, type: type);
}

/// Structure of path package dependency.
class PathPackageDependency extends PackageDependency {
  /// `path` field
  final String path;

  /// `relative` field
  final bool relative;

  /// Creates an instance of [PathPackageDependency]
  const PathPackageDependency({
    required String package,
    required String version,
    required DependencyType type,
    required this.path,
    required this.relative,
  }) : super(package: package, version: version, type: type);
}

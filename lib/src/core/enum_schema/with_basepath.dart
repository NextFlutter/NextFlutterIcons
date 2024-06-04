/// {@template with_basepath}
/// an enum with a base path
/// {@endtemplate}
abstract interface class WithBasePath implements Enum {
  WithBasePath(this.basePath);

  /// {@macro with_basepath}
  final String basePath;
}

/// {@template next_flutter_icons_variant}
/// a variant of the icon
/// {@endtemplate}
enum NextIconVariant {
  /// {@macro next_flutter_icons_variant_outline}
  bold('bold.svg'),

  /// {@macro next_flutter_icons_variant_filled}
  broken('broken.svg'),

  /// {@macro next_flutter_icons_variant_filled}
  bulk('bulk.svg'),

  /// {@macro next_flutter_icons_variant_filled}
  linear('linear.svg'),

  /// {@macro next_flutter_icons_variant_filled}
  outline('outline.svg'),

  /// {@macro next_flutter_icons_variant_filled}
  twoTone('two-tone.svg'),
  ;

  const NextIconVariant(this.trailingPath);

  /// {@macro next_flutter_icons_variant_outline}
  final String trailingPath;
}

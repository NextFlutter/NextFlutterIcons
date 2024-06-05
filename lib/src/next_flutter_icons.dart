import 'package:flutter/material.dart';
import 'package:next_flutter_icons/next_flutter_icons.dart';

export 'package:next_flutter_icons/src/core/enum_schema/with_basepath.dart';

export 'core/enum_schema/next_icon_variant.dart';
export 'icons/next_flutter_icons.dart';

/// {@template next_flutter_icons_variant_outline}
/// the icon
/// {@endtemplate}
class NextIcon extends StatelessWidget {
  ///{@macro next_flutter_icons_variant}
  const NextIcon({
    required this.icon,
    super.key,
    this.variant,
  });

  /// {@macro next_flutter_icons_variant_outline}
  const NextIcon.outline({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  /// {@macro next_flutter_icons_variant_twoTone}
  const NextIcon.twoTone({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.twoTone,
  });

  /// {@macro next_flutter_icons_variant_filled}
  const NextIcon.filled({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  /// {@macro next_flutter_icons_variant_outline}
  const NextIcon.bold({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  ///{@macro next_flutter_icons_variant_broken}
  const NextIcon.broken({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  ///{@macro next_flutter_icons_variant_bulk}
  const NextIcon.bulk({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  ///{@macro next_flutter_icons_variant_linear}
  const NextIcon.linear({
    required this.icon,
    super.key,
    this.variant = NextIconVariant.outline,
  });

  /// {@macro next_flutter_icons_variant}
  final NextIconVariant? variant;

  /// {@macro next_flutter_icons_icons}
  final WithBasePath icon;

  @override
  Widget build(BuildContext context) {
    // TODO(AbhiShake1): get default variant from theme
    final NextIconVariant(:trailingPath) = variant ?? NextIconVariant.outline;
    // TODO(AbhiShake1): get builder from theme and use fallback builder here
    return Image.asset(
      'assets/${icon.basePath}/$trailingPath',
      package: 'next_flutter_icons',
    );
  }
}

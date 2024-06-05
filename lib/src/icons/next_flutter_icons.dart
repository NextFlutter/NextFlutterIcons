import 'package:flutter/widgets.dart';
import 'package:next_flutter_icons/src/core/enum_schema/with_basepath.dart';

/// {@template next_flutter_icons}
/// pretty cool icons
/// {@endtemplate}
@staticIconProvider
enum NextIcons implements WithBasePath {
  battery2('battery2'),
  batteryEmpty('batteryEmpty'),
  trash('trash'),
  ;

  const NextIcons(super.basePath);
}

import 'dart:io';

import 'package:example_flutter_app/core/theme/colors.dart';
import 'package:example_flutter_app/core/theme/texts.dart';
import 'package:example_flutter_app/core/theme/theme_data/theme_data.dart';

sealed class NikeTheme {
  const NikeTheme();

  NikeColors get colors;

  NikeTextTheme get textTheme;

  NikeThemeData get data;
}

class NikeThemeUniform extends NikeTheme {
  const NikeThemeUniform(this.data);

  @override
  final NikeThemeData data;

  @override
  NikeColors get colors => data.colors;

  @override
  NikeTextTheme get textTheme => data.defaultTextTheme;
}

/// If you want to have different
/// themes for different platforms
class NikeThemeAdaptive extends NikeTheme {
  const NikeThemeAdaptive({
    this.ios,
    this.android,
    this.web,
  });
  final NikeThemeData? ios;
  final NikeThemeData? android;
  final NikeThemeData? web;

  @override
  NikeColors get colors {
    if (Platform.isIOS) {
      return ios!.colors;
    } else if (Platform.isAndroid) {
      return android!.colors;
    } else {
      return web!.colors;
    }
  }

  @override
  NikeTextTheme get textTheme {
    if (Platform.isIOS) {
      return ios!.defaultTextTheme;
    } else if (Platform.isAndroid) {
      return android!.defaultTextTheme;
    } else {
      return web!.defaultTextTheme;
    }
  }

  @override
  NikeThemeData get data {
    if (Platform.isIOS) {
      return ios!;
    } else if (Platform.isAndroid) {
      return android!;
    } else {
      return web!;
    }
  }
}

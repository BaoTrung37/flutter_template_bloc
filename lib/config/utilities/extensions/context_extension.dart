import 'package:example_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get locate => AppLocalizations.of(this)!;
}

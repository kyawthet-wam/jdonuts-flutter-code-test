import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// `3200` -> `3,200` using the active locale's grouping.
String formatThousands(BuildContext context, int value) {
  final locale = Localizations.localeOf(context).toString();
  return NumberFormat.decimalPattern(locale).format(value);
}

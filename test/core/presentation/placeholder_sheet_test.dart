import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/presentation/widgets/placeholder_sheet.dart';
import 'package:jdonuts/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('placeholder sheet spans the full screen width', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => showPlaceholderSheet(context, 'Google'),
            child: const Text('open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    final sheet = tester.getSize(find.byType(BottomSheet));
    expect(sheet.width, tester.view.physicalSize.width / 3);
  });
}

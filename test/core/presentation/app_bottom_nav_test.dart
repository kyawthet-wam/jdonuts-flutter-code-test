import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jdonuts/core/presentation/widgets/bottom_nav/app_bottom_nav.dart';
import 'package:jdonuts/core/presentation/widgets/bottom_nav/crown_icon.dart';
import 'package:jdonuts/core/theme/app_colors.dart';

const _labels = ['Home', 'Reward', 'Explore', 'Wallet', 'Settings'];

Widget _host({ValueChanged<int>? onTap, double width = 390}) {
  return MaterialApp(
    home: Scaffold(
      body: const SizedBox.expand(),
      bottomNavigationBar: SizedBox(
        width: width,
        child: StatefulBuilder(
          builder: (context, setState) {
            return _Nav(onTap: onTap);
          },
        ),
      ),
    ),
  );
}

class _Nav extends StatefulWidget {
  const _Nav({this.onTap});

  final ValueChanged<int>? onTap;

  @override
  State<_Nav> createState() => _NavState();
}

class _NavState extends State<_Nav> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return AppBottomNav(
      currentIndex: _index,
      onTap: (i) {
        setState(() => _index = i);
        widget.onTap?.call(i);
      },
      items: [
        for (final label in _labels)
          BottomNavItem(
            iconBuilder: (c) => label == 'Reward'
                ? CrownIcon(color: c)
                : materialNavIcon(Icons.circle_outlined, c),
            label: label,
          ),
      ],
    );
  }
}

/// Rendered x of the pill (the widget's `left` is only the animation target).
double _pillX(WidgetTester tester) {
  final pill = find.byWidgetPredicate(
    (w) =>
        w is DecoratedBox &&
        w.decoration is BoxDecoration &&
        (w.decoration as BoxDecoration).color == AppColors.accent,
  );
  return tester.getTopLeft(pill).dx;
}

Rect _pillRect(WidgetTester tester) {
  final pill = find.byWidgetPredicate(
    (w) =>
        w is DecoratedBox &&
        w.decoration is BoxDecoration &&
        (w.decoration as BoxDecoration).color == AppColors.accent,
  );
  return tester.getRect(pill);
}

void main() {
  testWidgets('stays compact with a home-indicator inset', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(padding: EdgeInsets.only(bottom: 34)),
          child: const Scaffold(bottomNavigationBar: _Nav()),
        ),
      ),
    );

    expect(
      tester.getSize(find.byType(AppBottomNav)).height,
      lessThanOrEqualTo(90),
    );
  });

  testWidgets('has a pink backdrop behind the bar', (tester) async {
    await tester.pumpWidget(_host());

    final pink = find.byWidgetPredicate(
      (w) => w is ColoredBox && w.color == AppColors.accent,
    );
    expect(pink, findsOneWidget);
    final bar = tester.getRect(find.byType(AppBottomNav));
    expect(tester.getRect(pink).bottom, bar.bottom);
    expect(tester.getRect(pink).top, greaterThan(bar.top));
  });

  testWidgets('the selected icon is inside the pill with breathing room', (
    tester,
  ) async {
    await tester.pumpWidget(_host());
    final pill = _pillRect(tester);
    final selectedIcon = tester.getRect(
      find.byIcon(Icons.circle_outlined).first,
    );
    final label = tester.getRect(find.text('Home'));

    expect(selectedIcon.left - pill.left, greaterThanOrEqualTo(8));
    expect(pill.right - label.right, greaterThanOrEqualTo(8));
  });

  testWidgets('the next tab keeps a clear gap from the pill', (tester) async {
    await tester.pumpWidget(_host());
    final pill = _pillRect(tester);
    final nextIcon = tester.getRect(find.byType(CrownIcon));

    expect(nextIcon.left - pill.right, greaterThanOrEqualTo(8));
  });

  testWidgets('shows the label only for the selected tab', (tester) async {
    await tester.pumpWidget(_host());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Reward'), findsNothing);
  });

  testWidgets('tapping a tab selects it and reports its index', (tester) async {
    int? tapped;
    await tester.pumpWidget(_host(onTap: (i) => tapped = i));

    await tester.tap(find.byType(CrownIcon));
    await tester.pumpAndSettle();

    expect(tapped, 1);
    expect(find.text('Reward'), findsOneWidget);
    expect(find.text('Home'), findsNothing);
  });

  testWidgets('the pill slides right when a later tab is selected', (
    tester,
  ) async {
    await tester.pumpWidget(_host());
    final before = _pillX(tester);

    await tester.tap(find.byType(CrownIcon));
    await tester.pump(); // builds the frame that starts the animation
    await tester.pump(const Duration(milliseconds: 200));
    final midway = _pillX(tester);
    await tester.pumpAndSettle();
    final after = _pillX(tester);

    expect(midway, greaterThan(before));
    expect(after, greaterThan(midway));
  });

  testWidgets('the pill returns to the first tab', (tester) async {
    await tester.pumpWidget(_host());
    final home = _pillX(tester);
    await tester.tap(find.byType(CrownIcon));
    await tester.pumpAndSettle();
    expect(_pillX(tester), greaterThan(home));

    await tester.tap(find.byIcon(Icons.circle_outlined).first);
    await tester.pumpAndSettle();

    expect(_pillX(tester), closeTo(home, 0.5));
  });

  testWidgets('selected tab is exposed to accessibility', (tester) async {
    await tester.pumpWidget(_host());

    expect(
      tester.getSemantics(find.bySemanticsLabel('Home')),
      isSemantics(isSelected: true, isButton: true),
    );
  });

  testWidgets('lays out at text scale 1.3 on a narrow phone', (tester) async {
    tester.view.physicalSize = const Size(960, 1920);
    tester.view.devicePixelRatio = 3;
    tester.platformDispatcher.textScaleFactorTestValue = 1.3;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(_host());
    await tester.tap(find.byType(CrownIcon));
    await tester.pumpAndSettle();

    expect(find.text('Reward'), findsOneWidget);
  });
}

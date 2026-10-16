import 'package:flutter_test/flutter_test.dart';

import 'package:ui_slicing_dasar/main.dart';

void main() {
  testWidgets('Menu utama menampilkan 4 latihan', (WidgetTester tester) async {
    await tester.pumpWidget(const UiSlicingApp());

    expect(find.text('1. Halaman Landing'), findsOneWidget);
    expect(find.text('2. Halaman Form'), findsOneWidget);
    expect(find.text('3. Halaman List'), findsOneWidget);
    expect(find.text('4. Halaman Profil'), findsOneWidget);
  });

  testWidgets('Navigasi ke halaman Landing', (WidgetTester tester) async {
    await tester.pumpWidget(const UiSlicingApp());

    await tester.tap(find.text('1. Halaman Landing'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Slicing UI'), findsOneWidget);
  });
}

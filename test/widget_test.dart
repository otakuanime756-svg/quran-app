import 'package:flutter_test/flutter_test.dart';
import 'package:quran_app/app.dart';

void main() {
  testWidgets('Quran app launches successfully', (tester) async {
    await tester.pumpWidget(const QuranApp());

    expect(find.byType(QuranApp), findsOneWidget);
  });
}

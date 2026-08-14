import 'package:flutter_test/flutter_test.dart';
import 'package:quran_app/app.dart';

void main() {
  testWidgets('Quran app starts', (tester) async {
    await tester.pumpWidget(const QuranApp());
    expect(find.text('القرآن الكريم'), findsOneWidget);
  });
}

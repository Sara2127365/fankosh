import 'package:fankosh/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Fankosh());
    expect(find.byType(Fankosh), findsOneWidget);
  });
}

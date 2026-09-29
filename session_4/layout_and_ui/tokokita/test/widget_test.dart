import 'package:flutter_test/flutter_test.dart';

import 'package:tokokita/main.dart';

void main() {
  testWidgets('TokoKita shows product list', (WidgetTester tester) async {
    await tester.pumpWidget(const TokoKitaApp());

    expect(find.text('TokoKita'), findsOneWidget);
    expect(find.text('Laptop'), findsOneWidget);
  });
}

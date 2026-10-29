import 'package:flutter_test/flutter_test.dart';
import 'package:practice_layouts/main.dart';

void main() {
  testWidgets('Меню открывается', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Макеты'), findsOneWidget);
  });
}

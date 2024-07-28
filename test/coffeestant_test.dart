import 'package:coffee_spot/screens/coffeestant/widgets/header_coffeestant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Coffeestant Screen harus dapat menampilkan widget', () {
    testWidgets(
      'HeaderCoffeestantWidget test',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: HeaderCoffeestantWidget(),
            ),
          ),
        );
        expect(
            find.text(
              'Ask Your Coffeestant Anything About Cafes in Malang City!',
            ),
            findsOneWidget);
        expect(find.byType(Text), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
      },
    );
  });
}

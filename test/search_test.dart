import 'package:coffee_spot/screens/search/widgets/app_bar_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Search Screen harus dapat menampilkan widget', () {
    testWidgets('AppBarSearchWidget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: AppBarSearchWidget(),
          ),
        ),
      );

      expect(find.text('Search'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}

import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/models/review_model.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/app_bar/app_bar_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/description/description_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/review/item_review_detail_cafe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';

void main() {
  final selectedCafe = CafeModel(
    id: 'id',
    name: 'Cafe A',
    ratingAverage: 4.5,
    reviews: [
      ReviewModel(
        name: 'User 1',
        description: 'Great cafe',
        rating: 5,
        date: '2024-01-01',
      ),
      ReviewModel(
        name: 'User 2',
        description: 'Nice place',
        rating: 4,
        date: '2024-01-01',
      ),
    ],
    description: 'description',
    address: 'address',
    image: 'image',
    operationalHour: 'hour',
    totalLikes: 12,
    isOpen: true,
    menus: [],
  );

  group('Detail Cafe Screen harus dapat menampilkan widget', () {
    testWidgets('AppBarDetailCafeWidget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: AppBarDetailCafeWidget(),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('DescriptionDetailCafeWidget test', (WidgetTester tester) async {
      final detailCafeViewModel = DetailCafeViewModel();
      detailCafeViewModel.selectedCafe = selectedCafe;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<DetailCafeViewModel>.value(value: detailCafeViewModel),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: DescriptionDetailCafeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('Description'), findsOneWidget);
      expect(find.text('description'), findsOneWidget);
    });

    testWidgets('ItemReviewDetailCafeWidget test', (WidgetTester tester) async {
      final detailCafeViewModel = DetailCafeViewModel();
      detailCafeViewModel.selectedCafe = selectedCafe;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<DetailCafeViewModel>.value(value: detailCafeViewModel),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: ItemReviewDetailCafeWidget(),
            ),
          ),
        ),
      );

      expect(find.text('Reviews'), findsOneWidget);
      expect(find.text('See All'), findsOneWidget);
      expect(find.text('User 1'), findsOneWidget);
      expect(find.text('Great cafe'), findsOneWidget);
    });
  });
}

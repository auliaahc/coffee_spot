import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/models/review_model.dart';
import 'package:coffee_spot/screens/reviews/widgets/header/header_reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/reviews/widgets/list_reviews/item_reviews_widget.dart';

void main() {
  group('Reviews Screen harus dapat menampilkan widget', () {
    testWidgets('HeaderReviewsWidget test', (WidgetTester tester) async {
      final selectedCafe = CafeModel(
        id: 'id',
        name: 'Cafe A',
        ratingAverage: 4.5,
        reviews: [
          ReviewModel(name: 'User 1', description: 'Great cafe', rating: 5, date: '2024-01-01'),
          ReviewModel(name: 'User 2', description: 'Nice place', rating: 4, date: '2024-01-01'),
        ],
        description: 'description',
        address: 'address',
        image: 'image',
        operationalHour: 'hour',
        totalLikes: 12,
        isOpen: true,
        menus: [],
      );

      final detailCafeViewModel = DetailCafeViewModel();
      detailCafeViewModel.selectedCafe = selectedCafe;

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<DetailCafeViewModel>.value(value: detailCafeViewModel),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: HeaderReviewsWidget(),
            ),
          ),
        ),
      );

      expect(find.text('4.5'), findsOneWidget);
      expect(find.text('(2 reviews)'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('ItemReviewsWidget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ItemReviewsWidget(
              name: 'User 1',
              description: 'Great cafe',
              rating: 5,
            ),
          ),
        ),
      );

      expect(find.text('User 1'), findsOneWidget);
      expect(find.byType(RatingBarIndicator), findsOneWidget);
      expect(find.text('Great cafe'), findsOneWidget);
    });
  });
}

import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/reviews/widgets/list_reviews/item_reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListReviewsWidget extends StatelessWidget {
  const ListReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailCafeViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'What They Say',
                  style: TextStyleConstant.subheaderDetailCafe,
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (provider.selectedCafe!.reviews!.isNotEmpty)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: provider.selectedCafe?.reviews!.length ?? 0,
                itemBuilder: (context, index) {
                  final review = provider.selectedCafe!.reviews![index];
                  return ItemReviewsWidget(
                    name: review.name,
                    description: review.description,
                    rating: review.rating.toDouble(),
                  );
                },
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'No reviews available',
                    style: TextStyleConstant.descReview.copyWith(fontSize: 13),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

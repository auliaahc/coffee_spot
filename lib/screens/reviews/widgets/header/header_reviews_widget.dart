import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HeaderReviewsWidget extends StatelessWidget {
  const HeaderReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final detailCafeViewModel = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          detailCafeViewModel!.ratingAverage.isNaN ? '0.0' : detailCafeViewModel.ratingAverage.toString(),
          style: TextStyleConstant.ratingAvg,
        ),
        RatingBarIndicator(
          itemSize: 30,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: ColorConstant.warningColor,
          ),
          rating: detailCafeViewModel.ratingAverage.isNaN ? 0 : detailCafeViewModel.ratingAverage,
        ),
        const SizedBox(height: 10),
        Text(
          '(${detailCafeViewModel.reviews!.length.toString()} reviews)',
          style: TextStyleConstant.totalReviews
        ),
        const SizedBox(height: 25),
        Divider(color: ColorConstant.gray6.withOpacity(0.3))
      ],
    );
  }
}
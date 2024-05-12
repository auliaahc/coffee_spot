import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ItemReviewDetailCafeWidget extends StatelessWidget {
  const ItemReviewDetailCafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe?.reviews;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/reviews'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: TextStyleConstant.subheaderDetailCafe,
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/reviews'),
                  child: Text('See All', style: TextStyleConstant.seeAll),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          if (provider != null && provider.isNotEmpty)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: BoxConstant.shadow,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxConstant.circlePrimary,
                      child: Center(
                        child: Text(
                          provider[0].name.isNotEmpty
                              ? provider[0].name[0]
                              : '',
                          style: TextStyleConstant.photoProfile,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            provider[0].name,
                            style: TextStyleConstant.nameReviewer,
                          ),
                          const SizedBox(height: 5),
                          RatingBarIndicator(
                            itemSize: 15,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: ColorConstant.warningColor,
                            ),
                            rating: 5,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            provider[0].description,
                            style: TextStyleConstant.descReview,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'No reviews available',
                  style: TextStyleConstant.descriptionDetailCafe,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

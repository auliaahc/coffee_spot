import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:coffee_spot/constants/color_constant.dart';

class ItemReviewsWidget extends StatelessWidget {
  final String name;
  final String description;
  final double rating;
  const ItemReviewsWidget({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
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
                      name[0],
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
                        name,
                        style: TextStyleConstant.nameReviewer,
                      ),
                      const SizedBox(height: 5),
                      RatingBarIndicator(
                        itemSize: 15,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: ColorConstant.warningColor ,
                        ),
                        rating: rating,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyleConstant.descReview,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

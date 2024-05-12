import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:coffee_spot/constants/color_constant.dart';

class SimpleCafeItemGlobalWidget extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final double ratingAvg;
  final Function() onTap;
  const SimpleCafeItemGlobalWidget({
    super.key,
    required this.name,
    required this.image,
    required this.address,
    required this.ratingAvg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: BoxConstant.shadow,
        ),
        width: 225,
        height: 170,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                width: 200,
                height: 100,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyleConstant.nameCafeSimpleItem,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorConstant.warningColor,
                      size: 15,
                    ),
                    Text(
                      ratingAvg.isNaN ? '0.0' : ratingAvg.toString(),
                      style: TextStyleConstant.nameReviewer,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyleConstant.descReview,
            )
          ],
        ),
      ),
    );
  }
}

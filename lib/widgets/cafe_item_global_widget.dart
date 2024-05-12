import 'package:coffee_spot/constants/image_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';

class CafeItemGlobalWidget extends StatelessWidget {
  final String name;
  final double ratingAverage;
  final int totalLikes;
  final int totalReviews;
  final String address;
  final String image;
  final bool isOpen;
  final Function() onTap;
  const CafeItemGlobalWidget({
    super.key,
    required this.name,
    required this.ratingAverage,
    required this.totalLikes,
    required this.totalReviews,
    required this.address,
    required this.image,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 25),
        height: 244,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ColorConstant.white,
          boxShadow: BoxConstant.shadow,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Image.asset(
                            ImageConstant.cafePlaceholder,
                            fit: BoxFit.fitWidth,
                          );
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8, right: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  width: 40,
                  height: 18,
                  decoration: BoxDecoration(
                    color: ColorConstant.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: ColorConstant.errorColor,
                        size: 10,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        totalLikes.toString(),
                        style: TextStyleConstant.totalLikesItemCafe,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyleConstant.nameItemCafe,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  width: 60,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isOpen
                        ? ColorConstant.successColor
                        : ColorConstant.errorColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      isOpen ? 'Open' : 'Closed',
                      style: TextStyleConstant.labelMenu,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star_rate,
                  color: ColorConstant.warningColor,
                ),
                const SizedBox(width: 7),
                Text(
                  ratingAverage.isNaN ? '0.0' : ratingAverage.toString(),
                  style: TextStyleConstant.seeAll,
                ),
                const SizedBox(width: 7),
                Text(
                  '•',
                  style: TextStyleConstant.divider,
                ),
                const SizedBox(width: 7),
                Text(
                  '$totalReviews reviews',
                  style: TextStyleConstant.divider,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SizedBox(
                  width: 235,
                  child: Text(
                    address,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleConstant.addressItemCafe,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

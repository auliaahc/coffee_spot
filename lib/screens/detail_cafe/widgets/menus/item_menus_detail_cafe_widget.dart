import 'package:coffee_spot/constants/image_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';

class ItemMenusDetailCafeWidget extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String category;
  const ItemMenusDetailCafeWidget({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (image == '-') {
      imageWidget = Image.asset(
        ImageConstant.menuPlaceholder,
        fit: BoxFit.fitHeight,
        width: 115,
      );
    } else {
      imageWidget = Image.network(
        image,
        fit: BoxFit.fitHeight,
        width: 115,
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorConstant.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: BoxConstant.shadow,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 115,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: imageWidget,
                      ),
                    ),
                    Positioned.fill(
                      child: FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.transparent, ColorConstant.white],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyleConstant.nameReviewer,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp. $price',
                      style: TextStyleConstant.descReview,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 65,
              height: 25,
              decoration: BoxDecoration(
                color: ColorConstant.primary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyleConstant.labelMenu,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

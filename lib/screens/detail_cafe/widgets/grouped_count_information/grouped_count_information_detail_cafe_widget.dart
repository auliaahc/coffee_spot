import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupedCountInformationDetailCafeWidget extends StatelessWidget {
  const GroupedCountInformationDetailCafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxConstant.circle,
                child: Icon(
                  Icons.restaurant,
                  color: ColorConstant.primary,
                  size: 25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                provider!.menus.length.toString(),
                style: TextStyleConstant.countCategoryDetailCafe,
              ),
              const SizedBox(height: 5),
              Text(
                'Menus',
                style: TextStyleConstant.categoryDetailCafe,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration:BoxConstant.circle,
                child: Icon(
                  Icons.star,
                  color: ColorConstant.primary,
                  size: 25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                provider.ratingAverage.isNaN ? '0.0' : provider.ratingAverage.toString(),
                style: TextStyleConstant.countCategoryDetailCafe,
              ),
              const SizedBox(height: 5),
              Text(
                'Rating',
                style: TextStyleConstant.categoryDetailCafe,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxConstant.circle,
                child: Icon(
                  Icons.thumb_up,
                  color: ColorConstant.primary,
                  size: 25,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                provider.totalLikes.toString(),
                style: TextStyleConstant.countCategoryDetailCafe,
              ),
              const SizedBox(height: 5),
              Text(
                'Likes',
                style: TextStyleConstant.categoryDetailCafe,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

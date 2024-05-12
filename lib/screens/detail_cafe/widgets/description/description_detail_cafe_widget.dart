import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class DescriptionDetailCafeWidget extends StatelessWidget {
  const DescriptionDetailCafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Description',
                style: TextStyleConstant.subheaderDetailCafe,
              ),
            ],
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            provider!.description,
            textAlign: TextAlign.justify,
            trimExpandedText: 'Show Less',
            trimCollapsedText: 'Show More',
            moreStyle: TextStyleConstant.readmoreDetailCafe,
            lessStyle: TextStyleConstant.readmoreDetailCafe,
            style: TextStyleConstant.descriptionDetailCafe,
          ),
        ],
      ),
    );
  }
}

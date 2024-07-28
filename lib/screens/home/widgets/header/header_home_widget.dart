import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/image_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello User',
                style: TextStyleConstant.inputFieldSearch,
              ),
              const SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  text: 'What ',
                  style: TextStyleConstant.headerHome1,
                  children: [
                    TextSpan(
                      text: 'cafe',
                      style: TextStyle(color: ColorConstant.primary),
                    ),
                    const TextSpan(text: ' would you like to visit today?'),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: AssetImage(ImageConstant.userPhotoProfile),
          ),
        ),
      ],
    );
  }
}

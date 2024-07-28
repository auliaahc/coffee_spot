import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class SubHeaderGlobalWidget extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SubHeaderGlobalWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyleConstant.nameItemCafe
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: TextStyleConstant.seeAll,
          ),
        )
      ],
    );
  }
}

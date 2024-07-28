import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class HeaderCoffeestantWidget extends StatelessWidget {
  const HeaderCoffeestantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxConstant.decoration,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Ask Your Coffeestant Anything About Cafes in Malang City!',
          style: TextStyleConstant.headerCoffeestant,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class SearchFieldHomeWidget extends StatelessWidget {
  const SearchFieldHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: BoxConstant.shadow,
        ),
        child: TextField(
          enabled: false,
          cursorColor: ColorConstant.primary,
          textInputAction: TextInputAction.search,
          style: TextStyleConstant.inputFieldSearch,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstant.primary,
            ),
            contentPadding: const EdgeInsets.only(left: 50, right: 17, top: 12),
            hintText: 'Search any cafe',
            hintStyle: TextStyleConstant.inputFieldCoffeestant.copyWith(fontSize: 12),
            border: InputBorder.none,
            focusColor: ColorConstant.primary,
          ),
        ),
      ),
    );
  }
}

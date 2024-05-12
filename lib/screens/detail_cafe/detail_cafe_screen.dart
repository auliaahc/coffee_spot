import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/app_bar/app_bar_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/description/description_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/grouped_count_information/grouped_count_information_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/header/header_cafe_detail_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/menus/list_menus_detail_cafe_widget.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/review/item_review_detail_cafe_widget.dart';
import 'package:flutter/material.dart';

class DetailCafeScreen extends StatelessWidget {
  const DetailCafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppBarDetailCafeWidget(),
      extendBodyBehindAppBar: true,
      backgroundColor: ColorConstant.gray1,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              HeaderCafeDetailWidget(),
              SizedBox(height: 30),
              GroupedCountInformationDetailCafeWidget(),
              SizedBox(height: 30),
              DescriptionDetailCafeWidget(),
              SizedBox(height: 30),
              ItemReviewDetailCafeWidget(),
              SizedBox(height: 30),
              ListMenusDetailCafeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

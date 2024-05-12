import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/screens/reviews/widgets/header/header_reviews_widget.dart';
import 'package:coffee_spot/screens/reviews/widgets/list_reviews/list_reviews_widget.dart';
import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarGlobalWidget(title: 'Reviews'),
      backgroundColor: ColorConstant.gray1,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                HeaderReviewsWidget(),
                SizedBox(height: 20),
                ListReviewsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
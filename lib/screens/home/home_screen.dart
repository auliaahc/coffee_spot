import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/screens/home/widgets/header/header_home_widget.dart';
import 'package:coffee_spot/screens/home/widgets/most_liked_cafes/list_most_liked_cafes_home_widget.dart';
import 'package:coffee_spot/screens/home/widgets/open_cafes/list_open_cafes_home_widget.dart';
import 'package:coffee_spot/screens/home/widgets/search_field/search_field_home_widget.dart';
import 'package:coffee_spot/screens/home/widgets/top_rated_cafes/list_top_rated_cafes_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchAllCafesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray1,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                HeaderHomeWidget(),
                SizedBox(height: 20),
                SearchFieldHomeWidget(),
                SizedBox(height: 30),
                ListOpenCafesHomeWidget(),
                SizedBox(height: 20),
                ListTopRatedCafesHomeWidget(),
                SizedBox(height: 20),
                ListMostLikedCafesHomeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

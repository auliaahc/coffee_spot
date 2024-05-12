import 'package:coffee_spot/screens/list_cafes/top_rated/widgets/app_bar_top_rated_list_cafes_widget.dart';
import 'package:coffee_spot/screens/list_cafes/top_rated/widgets/list_top_rated_cafes_widget.dart';
import 'package:flutter/material.dart';

class TopRatedCafesScreen extends StatelessWidget {
  const TopRatedCafesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarTopRatedListCafesWidget(),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 10),
        child: Column(
          children: [
            ListTopRatedCafes(),
          ],
        ),
      ),
    );
  }
}

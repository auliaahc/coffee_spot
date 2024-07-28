import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/screens/list_cafes/most_liked/widgets/app_bar_most_liked_list_cafes_widget.dart';
import 'package:coffee_spot/screens/list_cafes/most_liked/widgets/list_most_liked_cafes_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CafeMostLikedScreen extends StatelessWidget {
  const CafeMostLikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: const AppBarMostLikedListCafesWidget(),
      body: homeViewModel.cafesByLikes.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Column(
                children: [
                  ListMostLikedCafesWidget(),
                ],
              ),
            ),
    );
  }
}

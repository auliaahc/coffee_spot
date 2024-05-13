import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/screens/list_cafes/open_cafes/widgets/app_bar_open_cafes_list_cafes_widget.dart';
import 'package:coffee_spot/screens/list_cafes/open_cafes/widgets/list_open_cafes_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenCafesScreen extends StatelessWidget {
  const OpenCafesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Scaffold(
      appBar: const AppBarOpenCafesListCafesWidget(),
      body: homeViewModel.cafesByStatus.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 10),
              child: Column(
                children: [
                  ListOpenCafesWidget(),
                ],
              ),
            ),
    );
  }
}

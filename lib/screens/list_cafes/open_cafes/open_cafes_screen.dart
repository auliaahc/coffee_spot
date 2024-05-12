import 'package:coffee_spot/screens/list_cafes/open_cafes/widgets/app_bar_open_cafes_list_cafes_widget.dart';
import 'package:coffee_spot/screens/list_cafes/open_cafes/widgets/list_open_cafes_widget.dart';
import 'package:flutter/material.dart';

class OpenCafesScreen extends StatelessWidget {
  const OpenCafesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarOpenCafesListCafesWidget(),
      body: Padding(
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

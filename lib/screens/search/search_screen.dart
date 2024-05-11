import 'package:coffee_spot/screens/search/widgets/app_bar_search_widget.dart';
import 'package:coffee_spot/screens/search/widgets/input_field_search_widget.dart';
import 'package:coffee_spot/screens/search/widgets/list_result_search_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSearchWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            InputFieldSearchWidget(),
            SizedBox(height: 20),
            ListResultSearchWidget(),
          ],
        ),
      ),
    );
  }
}

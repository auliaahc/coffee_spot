import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/screens/search/search_view_model.dart';
import 'package:coffee_spot/widgets/cafe_item_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListResultSearchWidget extends StatelessWidget {
  const ListResultSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SearchViewModel>(
        builder: (context, searchViewModel, _) {
          return ListView.builder(
            itemCount: searchViewModel.searchResult.length,
            itemBuilder: (context, index) {
              CafeModel cafe = searchViewModel.searchResult[index];
              return CafeItemGlobalWidget(
                name: cafe.name,
                ratingAverage: cafe.ratingAverage,
                totalLikes: cafe.totalLikes,
                totalReviews: cafe.reviews!.length,
                address: cafe.address,
                image: cafe.image,
                isOpen: cafe.isOpen,
              );
            },
          );
        },
      ),
    );
  }
}
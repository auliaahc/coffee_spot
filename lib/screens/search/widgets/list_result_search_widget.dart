import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
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
          if (searchViewModel.searchInput != '' && searchViewModel.searchResult.isEmpty) {
            return Center(child: Text('No cafes found', style: TextStyleConstant.descriptionDetailCafe));
          } else {
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
                  onTap: () {
                    final detailCafeViewModel = Provider.of<DetailCafeViewModel>(context, listen: false);
                    detailCafeViewModel.selectedCafe = cafe;
                    Navigator.pushNamed(context, '/details');
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/widgets/cafe_item_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOpenCafesWidget extends StatelessWidget {
  const ListOpenCafesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Consumer<HomeViewModel>(builder: (context, homeViewModel, _) {
      return ListView.builder(
          itemCount: homeViewModel.cafesByStatus.length,
          itemBuilder: (context, index) {
            CafeModel cafe = homeViewModel.cafesByStatus[index];
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
          });
    }));
  }
}

// import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/widgets/simple_cafe_item_global_widget.dart';
import 'package:coffee_spot/widgets/sub_header_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMostLikedCafesHomeWidget extends StatelessWidget {
  const ListMostLikedCafesHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubHeaderGlobalWidget(text: 'Most Liked', onPressed: () => Navigator.pushNamed(context, '/most-liked-cafe')),
        const SizedBox(height: 12),
        Consumer<HomeViewModel>(
          builder: (context, provider, child) {
            final listCafesToShow = provider.cafesByLikes.take(5).toList();
            if (provider.cafesByLikes.isNotEmpty) {
              return SizedBox(
                height: 185,
                child: ListView.builder(
                  itemCount: listCafesToShow.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final cafe = listCafesToShow[index];
                    return SimpleCafeItemGlobalWidget(
                      name: cafe.name,
                      image: cafe.image,
                      address: cafe.address,
                      ratingAvg: cafe.ratingAverage,
                      onTap: () {
                        // final detailCafeViewModel = Provider.of<DetailCafeViewModel>(context, listen: false);
                        // detailCafeViewModel.selectedCafe = cafe;
                        Navigator.pushNamed(context, '/details');
                      },
                    );
                  },
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}
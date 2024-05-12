import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/widgets/simple_cafe_item_global_widget.dart';
import 'package:coffee_spot/widgets/sub_header_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTopRatedCafesHomeWidget extends StatelessWidget {
  const ListTopRatedCafesHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubHeaderGlobalWidget(text: 'Top Rated', onPressed:() => Navigator.pushNamed(context, '/top-rated-cafe')),
        const SizedBox(height: 12),
        Consumer<HomeViewModel>(
          builder: (context, provider, child) {
            final listCafesToShow = provider.cafesByRating.take(5).toList();
            if (provider.cafesByRating.isNotEmpty) {
              return SizedBox(
                height: 185,
                child: ListView.builder(
                  itemCount: listCafesToShow.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final cafe = listCafesToShow[index];
                    return SimpleCafeItemGlobalWidget(
                      name: cafe.name,
                      image: cafe.image,
                      address: cafe.address,
                      ratingAvg: cafe.ratingAverage,
                      onTap: () {
                        final detailCafeViewModel = Provider.of<DetailCafeViewModel>(context, listen: false);
                        detailCafeViewModel.selectedCafe = cafe;
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
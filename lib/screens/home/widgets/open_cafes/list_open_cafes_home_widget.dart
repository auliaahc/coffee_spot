// import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:coffee_spot/widgets/simple_cafe_item_global_widget.dart';
import 'package:coffee_spot/widgets/sub_header_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOpenCafesHomeWidget extends StatelessWidget {
  const ListOpenCafesHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubHeaderGlobalWidget(text: 'Discover Open Cafes', onPressed: () => Navigator.pushNamed(context, '/open-cafe')),
        const SizedBox(height: 12),
        Consumer<HomeViewModel>(
          builder: (context, provider, child) {
            final listCafesToShow = provider.cafesByStatus.take(5).toList();
            if (provider.cafesByStatus.isNotEmpty) {
              return SizedBox(
                height: 185,
                child: ListView.builder(
                  itemCount: listCafesToShow.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final cafe = listCafesToShow[index];
                    return SimpleCafeItemGlobalWidget(
                      onTap: () {
                        // final detailCafeViewModel = Provider.of<DetailCafeViewModel>(context, listen: false);
                        // detailCafeViewModel.selectedCafe = cafe;
                        Navigator.pushNamed(context, '/details');
                      },
                      name: cafe.name,
                      image: cafe.image,
                      address: cafe.address,
                      ratingAvg: cafe.ratingAverage,
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

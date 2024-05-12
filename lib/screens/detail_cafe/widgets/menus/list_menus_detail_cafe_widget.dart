import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/detail_cafe/detail_cafe_view_model.dart';
import 'package:coffee_spot/screens/detail_cafe/widgets/menus/item_menus_detail_cafe_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMenusDetailCafeWidget extends StatelessWidget {
  const ListMenusDetailCafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailCafeViewModel>(context, listen: false).selectedCafe!.menus;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menus',
            style: TextStyleConstant.subheaderDetailCafe,
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: provider.map((menu) {
              return Column(
                children: [
                  ItemMenusDetailCafeWidget(
                    name: menu.name,
                    price: menu.price,
                    image: menu.image,
                  ),
                  const SizedBox(height: 15),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
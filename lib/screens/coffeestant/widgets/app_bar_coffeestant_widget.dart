import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class AppBarCoffeestantWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCoffeestantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Coffeestant',
        style: TextStyleConstant.appbar
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

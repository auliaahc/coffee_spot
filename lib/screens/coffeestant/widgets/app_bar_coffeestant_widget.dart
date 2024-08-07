import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class AppBarCoffeestantWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCoffeestantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarGlobalWidget(title: 'Coffeestant');
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

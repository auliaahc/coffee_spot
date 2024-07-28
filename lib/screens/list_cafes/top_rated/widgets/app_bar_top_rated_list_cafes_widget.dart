import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class AppBarTopRatedListCafesWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTopRatedListCafesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarGlobalWidget(title: 'Top Rated');
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class AppBarMostLikedListCafesWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMostLikedListCafesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarGlobalWidget(title: 'Most Liked');
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
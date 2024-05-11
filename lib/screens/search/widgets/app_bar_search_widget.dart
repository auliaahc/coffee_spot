import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class AppBarSearchWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarGlobalWidget(title: 'Search');
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
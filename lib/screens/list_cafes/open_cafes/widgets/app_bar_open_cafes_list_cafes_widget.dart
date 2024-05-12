import 'package:coffee_spot/widgets/app_bar_global_widget.dart';
import 'package:flutter/material.dart';

class AppBarOpenCafesListCafesWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarOpenCafesListCafesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBarGlobalWidget(title: 'Open Cafes');
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
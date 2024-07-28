import 'package:flutter/material.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';

class AppBarGlobalWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarGlobalWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyleConstant.appbar
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

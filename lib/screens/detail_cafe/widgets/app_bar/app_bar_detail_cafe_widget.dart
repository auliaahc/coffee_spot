import 'package:coffee_spot/constants/color_constant.dart';
import 'package:flutter/material.dart';

class AppBarDetailCafeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDetailCafeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(color: ColorConstant.gray1, shape: BoxShape.circle),
          child: Icon(Icons.arrow_back, color: ColorConstant.secondary),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

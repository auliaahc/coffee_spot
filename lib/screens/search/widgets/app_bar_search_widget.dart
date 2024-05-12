import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarSearchWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Search',
        style: TextStyleConstant.appbar,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Provider.of<SearchViewModel>(context, listen: false).clearCurrentSearchInput();
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

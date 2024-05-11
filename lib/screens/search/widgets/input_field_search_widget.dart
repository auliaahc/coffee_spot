import 'package:coffee_spot/constants/box_constant.dart';
import 'package:coffee_spot/constants/color_constant.dart';
import 'package:coffee_spot/constants/text_style_constant.dart';
import 'package:coffee_spot/screens/search/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputFieldSearchWidget extends StatelessWidget {
  const InputFieldSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);
    return Container(
      height: 48,
      decoration: BoxConstant.decoration,
      child: TextField(
        onChanged: (value) {
          searchViewModel.onChangedSearchInput(value);
        },
        cursorColor: ColorConstant.primary,
        controller: searchViewModel.searchInputController,
        textInputAction: TextInputAction.search,
        style: TextStyleConstant.inputFieldSearch,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: ColorConstant.primary),
          contentPadding: const EdgeInsets.only(left: 50, right: 17, top: 12),
          hintText: 'Search any cafe',
          hintStyle: TextStyleConstant.hintSearch,
          border: InputBorder.none,
          focusColor: ColorConstant.primary,
        ),
      ),
    );
  }
}
